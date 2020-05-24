require 'minitest/autorun'
require_relative 'transaction.rb'
require_relative 'cash_register.rb'


class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 50

    expected_change = transaction.amount_paid - transaction.item_cost
    result = register.change(transaction)

    assert_equal(expected_change, result)
  end

  def test_give_receipt
    item_cost = 35
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end

  def test_prompt_for_payment
    transaction = Transaction.new(459.99)
    input = StringIO.new("500.00\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(500.00, transaction.amount_paid)
  end
end

# def prompt_for_payment(input: $stdin) # We've set a default parameter for stdin
#   loop do
#     puts "You owe $#{item_cost}.\nHow much are you paying?"
#     @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
#     break if valid_payment? && sufficient_payment?
#     puts 'That is not the correct amount. ' \
#          'Please make sure to pay the full cost.'
#   end
# end
