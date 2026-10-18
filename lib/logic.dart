
class Member{final String name,group,phone;const Member(this.name,this.group,this.phone);}
class Giving{final String member,type;final int amount;const Giving(this.member,this.type,this.amount);}
final members=[Member('Grace Eze','Choir','08030000001'),Member('Samuel Ade','Ushers','08030000002'),Member('Ruth Musa','Youth','08030000003'),Member('Mary Obi','Women','08030000004')];
final givings=[Giving('Grace Eze','Tithe',25000),Giving('Samuel Ade','Offering',5000),Giving('Ruth Musa','Tithe',15000)];
final groups=['Choir','Ushers','Youth','Women','Men','Children'];
final events=['Sunday Service 9am','Midweek Bible Study Wednesday 6pm','Youth Concert Saturday 4pm'];
int get totalGiving=>givings.fold(0,(s,g)=>s+g.amount);
int membersIn(String g)=>members.where((m)=>m.group==g).length;
