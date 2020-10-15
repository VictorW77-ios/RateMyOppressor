Model Outline: 

**User** 
``has_many :reviews``
``has_many :officers, through: :reviews``
- email 
- password_digest 
- username

**Reviews**
``belongs_to :user``
``belongs_to :officer``
- content (title, text)
- join table between users & officers

**Officer** 
``has_many :reviews``
``has_many :users, through :reviews``
- name 
- description 

