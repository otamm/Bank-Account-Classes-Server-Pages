require 'sinatra'
require 'csv'
require_relative 'transaction'
require_relative 'account'

$account_data = []
CSV.foreach('balances.csv', headers: true) do |row|
  $account_data << Account.new(row.to_hash["Account"],row.to_hash["Balance"])
end



$transaction_data = []

CSV.foreach('bank_data.csv', headers: true) do |row|
  $transaction_data << Transaction.new(row.to_hash["Date"],row.to_hash["Amount"],row.to_hash["Description"],row.to_hash["Account"])
end

$account_data.each do |account|
  $transaction_data.each do |transaction|
    account.get_amount(transaction.info)
  end
end

get '/accounts' do
  $account_data
  erb :accounts_list
end

get '/accounts/:account' do
  $account_name = params[:account].gsub('+',' ')
  $specific_account = []
  $account_data.each do |account|
    if account.account == $account_name
      $specific_account << account
    end
  end
  erb :account_page
end






