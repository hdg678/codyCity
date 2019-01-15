test = "
require \"test/unit\"

eval(submission)

class AdditionTest < Test::Unit::TestCase
  def test_addition()
    assert add(1, 2)== 3
  end
end

require 'test/unit/ui/console/testrunner'
Test::Unit::UI::Console::TestRunner.run(AdditionTest)
"

submission = "
print(\"hello world\\n\")

def add(a, b)
  a + b
end
"

eval(test)
