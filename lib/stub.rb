class Repository
  attr_accessor :owner, :commits, :users
  def initialize(owner,name)
    @owner=owner
    owner.repositories << self
    @commits=[]
    @name=name
  end
  def <<(commit)
    commit.repository=self
    if commit.author
      commit.author << commit
    else
      commit.author=@owner
      commit.author << @owner

    end
    @commits << commit
    
  end
end
class Commit
  attr_accessor :author, :repository
end
class User
  attr_accessor :repositories, :commits,:comments, :name
  def initialize(name)
    @repositories=[]
    @name=name
    @commits=[]
  end
  def <<(commit)
    @commits << commit
  end
  def delete_repository (repository)
    if repository.owner == self
      repository.owner = nil
      @repositories.delete repository
      repository.commits.each do |c|
        c.author.delete_commit c
      end
    end
  end
  def delete_commit (c)
    @commits.delete c
  end
end
class Comment
  attr_accessor :author, :commit
end



if __FILE__==$0
  u=User.new "david"
  r=Repository.new(u,'kenrel')
  c=Commit.new
  c2=Commit.new
  r << c << c2
end

