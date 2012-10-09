class CucumberGreeter
  def greet
  end
end

Given /^a greeter$/  do
  @greeter = CucumberGreeter.new
end

When /^I send it the greet message $/ do
  @message = @greeter.greet
end

Then /^I should see '([^"]*)'$/ do
  @message.should == greeting
end