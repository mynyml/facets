require 'facets/string/unindent'
require 'test/unit'
require 'redgreen'

class TC_String_Unindent < Test::Unit::TestCase

  ## simple indentation

  def test_removes_space_indentation
    assert_equal "abc", "\s\sabc".unindent
  end

  def test_removes_tab_indentation
    assert_equal "abc", "\tabc".unindent
  end

  def test_removes_space_and_tab_indentation
    assert_equal "abc", "\t\sabc".unindent
  end

  ## multi-line indentation

  def test_removes_indentation
    assert_equal "abc\nabc", "\tabc\n\tabc".unindent
  end

  def test_keeps_relative_indentation
    assert_equal "abc\n\tabc", "\tabc\n\t\tabc".unindent
  end

  def test_ignores_blank_lines_for_indent_calculation
    assert_equal "\nabc\n\n\tabc\n", "\n\tabc\n\n\t\tabc\n".unindent
  end

  ## unindent!

  def test_modifies_string_in_place
    str = "\s\sabc"
    str.unindent!
    assert_equal "abc", str
  end
end

