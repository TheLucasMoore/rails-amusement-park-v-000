class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness - self.nausea > 0
      return "happy"
    else
      return "sad"
    end
  end

  def nausea_report
    if self.nausea > 2
      return "sick"
    else
      return "not sick!"
    end
  end

end
