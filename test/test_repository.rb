require 'linguist/repository'

require 'test/unit'

class TestRepository < Test::Unit::TestCase
  include Linguist

  def repo(base_path)
    Repository.from_directory(base_path)
  end

  def linguist_repo
    repo(File.expand_path("../..", __FILE__))
  end

  def test_linguist_language
    # assert_equal Language['Ruby'], linguist_repo.language
  end

  def test_linguist_languages
    assert linguist_repo.languages[Language['Ruby']] > 30_000
    assert linguist_repo.languages[Language['Python']] > 1000
  end

  def test_linguist_size
    assert linguist_repo.size > 30_000
  end
end
