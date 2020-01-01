const medrecords = artifacts.require('./medrecords.sol')

require('chai')
    .use(require('chai-as-promised'))
    .should()


contract('medrecords', ([patient, doctor]) => {
    let medicalRecord;

    before(async () => {
        medicalRecord = await medrecords.deployed()
    })

    describe('patientDetails', async () => {
        let result;
         let resultpat; 
        it('new doctor added successfully', async () => {
            result = await medicalRecord.logindoc( { from: doctor })
            const event1 = result.logs[0].args
            // assert.equal(event1.doctor , doctor,"correct doc")
            // resultpat = await medicalRecord.createpermission(patient,{from:doctor})
            // const event2 = resultpat.logs[0].args
            // assert.equal(event2.pat, patient,"correct pat")
            // assert.equal(event2.permission,true,"correct")
            // assert.equal(event2.p,true,"correct");
            


        })
       

    })
})