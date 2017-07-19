kfz = /[A-Z][A-Z]?[A-Z]?-[A-Z][A-Z]?[1-9][0-9]*/

kfz = { :kind => :letter, 
      :letter => "E",
      :next => 
        { :kind => :optional,
          :optional =>
          { :kind => :letter,
            :letter => "C",
            :next => { :kind => :optional,
                       :optional =>
                       { :kind => :letter,
                         :letter => "K",
                         :next => 
                           { :kind => :letter,
                             :letter => "-",
                             :next =>
                               { :kind => :letter,
                                 :letter => "H",
                                 :next => 
                                   { :kind => :optional,
                                     :optional =>
                                       { :kind => :letter,
                                         :letter => "U",
                                         :next =>
                                           { :kind => :letter,
                                             :letter => "1",
                                             :next =>
                                               { :kind => :star,
                                                 :star => 
                                                   { :kind => :letter,
                                                     :letter => "0",
                                                     :next => :epsilon },
                                                 :next => :epsilon
                                               }
                                           }
                                       }
                                   }
                               }
                           }
                       }
                  }
           }
     }
  }

def letter(char,beta)
  return { :kind => :letter,
           :letter => char,
           :next => beta
         }
end

def alt(alpha,beta)
  return { :kind => :or,
           :first => alpha,
           :second => beta }
end


def star(alpha,beta)
  return { :kind => :star,
           :star => alpha,
           :next => beta }
end

def seq(alpha,beta)
  if alpha == :epsilon then
    return beta
  else
    case alpha[:kind]
      when :letter
        return letter(alpha[:letter],
                      seq(alpha[:next],beta))
      when :or
        return alt(seq(alpha[:first],beta),
                   seq(alpha[:second],beta))
      when :star
        return star(alpha,seq(alpha[:next],beta))
    end  
  end      
end

def match(alpha,str,index) # returns a boolean
  if alpha == :epsilon then
    return str.size == index
  else
    case alpha[:kind]
      when :letter
        if alpha[:letter] == str[index] then
          return match(alpha[:next],str,index+1)
        else
          return false
        end
      when :or
        return (match(alpha[:first],str,index) ||
                match(alpha[:second],str,index))
      when :star
        return match(alt(alpha[:next],seq(alpha[:star],alpha)),str,index)
    end  
  end              
end


r = /ab*b|c/
r = alt( letter("a",
                star(alt(letter("b",:epsilon),
                         letter("c",:epsilon)),
                     letter("b",:epsilon)
                    )
               ),
          letter("c",:epsilon)
        )

p r

puts match(r,"abcb"+"b"*50+"cb",0)





















