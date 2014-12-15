require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:slash_order))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["slash_hutson@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x JqueryTheBook/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:slash_order))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["slash_hutson@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>JqueryTheBook<\/td>/, mail.body.encoded
  end

end
