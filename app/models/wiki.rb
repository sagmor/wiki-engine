module Wiki
  PATH = File.join(Rails.root, 'wiki.git').freeze
  MASTER = 'master'.freeze
  
  def self.repo
    @repo ||= Grit::Repo.new(PATH)
    @repo
  end
  
  def self.master
    self.repo.commit(MASTER)
  end
  
  class Error < RuntimeError
  end
  
  class InvalidPageVersionError < Error
  end
end