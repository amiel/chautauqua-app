require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "acceptance" do
    @expected.subject = 'Mailer#acceptance'
    @expected.body    = read_fixture('acceptance')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_acceptance(@expected.date).encoded
  end

  test "wait_list" do
    @expected.subject = 'Mailer#wait_list'
    @expected.body    = read_fixture('wait_list')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_wait_list(@expected.date).encoded
  end

end
