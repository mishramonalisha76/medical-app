pragma solidity ^0.5.0;



contract medrecords{
   struct Patient{
        address patient;
        string[] record;
        uint i;

   }
   Patient[] public patients;
   uint public id =0;
   struct Doctor{
        address doctor;
        mapping(address => bool) pat;

   }
   
   event doctoradded(
     address doctor

   );

   event docpat(
        address pat,
        bool permission
     //    bool p

   );
//     mapping (address => Patient) public patients;
    address[] public patientAccts;
    mapping (address => uint) public patientid;
    mapping (address => bool) public oldpatients;
    mapping (address => Doctor) public doctors;
    address[] public doctorAccts;
    mapping (address => bool) public doc;

//     function loginpat(address patient) public{

// //     require(!oldpatients[patient],"old patient");
//     patients[patient] = Patient(patient,new string[](0));
//     patientAccts.push(patient);
//     oldpatients[patient] = true;
//     }
    //doctor
    function logindoc(address doctor) public {
         
     // require(!doc[doctor]," old doc");
    doctors[doctor] = Doctor(doctor);
    doctorAccts.push(doctor);
    doc[doctor] = true;
     emit doctoradded(doctor);
   

    }

    function createpermission(address patient) public{
     //  require(!doctors[msg.sender].pat[patient],"permission already there");
      doctors[msg.sender].pat[patient] = true;
       emit docpat(patient,true);
       patients.push(Patient(patient,new string[](0),0));
     //  patients[patient] = Patient(patient,new string[](0),2);
     patientid[patient]=id;
     id++;
      patientAccts.push(patient);
      oldpatients[patient] = true;
      

    }
    function verifypat(address patient) public view returns(bool){
         return  oldpatients[patient];
    }

    function patrecord(string memory hash, address patient) public{
            
            Patient storage pat=patients[patientid[patient]];
            
            pat.record.push(hash);
            pat.i++;


     //     patients[patient].record.push(hash);
     //     patients[patient].i ++;
    }
    function verify(address patient) public returns(bool){
         
       return doctors[msg.sender].pat[patient];
     }
     function recordcount() public  returns(uint ){
     // return patients[msg.sender].i;
       
         
              
            Patient storage pat=patients[patientid[msg.sender]];
            return pat.i;
            


     }

     function record(uint z) public  returns(string memory ){
     //   return patients[msg.sender].record[z];
             Patient storage pat =patients[patientid[msg.sender]];
            
            return pat.record[z];
     }

}