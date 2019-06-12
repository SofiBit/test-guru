class RenamePassedTestsToTestPassages < ActiveRecord::Migration[5.2]
  def change
    rename_table :passed_tests, :test_passages
  end
end
