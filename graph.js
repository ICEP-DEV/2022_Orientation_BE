//PORT FOR THE API ENDPOINT________________________
const { GRAPH_PORT,DATABASE } = require('./globals')
//_________________________________________________
//Module Importing
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
//cross-origin
const cors = require('cors');
//----------------------------------------------------------------------------------Stock Libraries
//Student
//--Test
const TestQuery_cnxt = require("./contexts/Common/TestQuery")
const Student_cnxt = require("./contexts/Common/Students")
//--Auth
const Registration_cnxt = require('./contexts/Authentication/Registration')
const Login_cnxt = require("./contexts/Authentication/Login")
const Forgotten_cnxt = require("./contexts/Authentication/Forgotten")
//--Profile
const Profile_Update_cnxt = require("./contexts/Profile/Update")

//Blog
const Blog_cnxt = require('./contexts/Blog/blog')

//Admin
const RegistrationAdm_cnxt = require('./contexts/Authentication/Register_Adm')
const LoginAdm_cnxt = require("./contexts/Authentication/Login_Adm")

const LoginTrackAdm_cnxt = require('./contexts/Tracking/LoginsOverview')
const UpdateVideo_cnxt = require('./contexts/Administrator/UpdateVideo')
const SearchAll_cnxt = require('./contexts/Administrator/GlobalSearch')
// //common

//--Stats
const Stats_cnxt = require('./contexts/Statistics/Stats')
//--Track
const Track_Add_cnxt = require('./contexts/Tracking/TrackAdd')
const Track_Get_cnxt = require('./contexts/Tracking/TrackGet')
const Track_Prog_cnxt = require('./contexts/Tracking/Progress')
const Track_Survey_cnxt = require('./contexts/Tracking/Survey')
const Track_Orientation_cnxt = require('./contexts/Tracking/Orientation')
//Orientation
const AllCampus_cnxt = require("./contexts/Orientation/AllCampus")
const Faculty_cnxt = require("./contexts/Orientation/Faculty")
const Videos_cnxt = require("./contexts/Orientation/Video")
const SurvQuestion_cnxt = require("./contexts/Orientation/Questions")


//-----------------------------------------------------------------------------------Custome Libraries
//-----------------------------------------------------------------------------------Express Server Algorithms
app.use(bodyParser.json());
app.use(cors({origin: '*'}));


app.use(function(req, res, next) {
    //Header allowences of METHODS
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With','Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

app.get('/', (req, res) => { 
    res.send('Not a accessbled Address graph'); 
});

//context channelling Student
app.use('/Test/TestQuery', TestQuery_cnxt);
app.use('/Auth/Registration', Registration_cnxt);
app.use('/Stud/Student', Student_cnxt);
app.use('/Auth/Login', Login_cnxt);
app.use('/Auth/Forgotten',Forgotten_cnxt);
app.use('/Profile/Update',Profile_Update_cnxt);
app.use('/Orientation/Faculty',Faculty_cnxt)
app.use('/Orientation/Videos', Videos_cnxt)

//context channelling Admin
app.use('/Auth/Registration_Admin', RegistrationAdm_cnxt);
app.use('/Auth/Login_Admin', LoginAdm_cnxt);
app.use('/Track/LoginOverview',LoginTrackAdm_cnxt)
app.use('/Admin/UpdateDeleteVideo',UpdateVideo_cnxt)
app.use('/Search',SearchAll_cnxt)

//context to common entities
app.use('/Stat/Stats', Stats_cnxt);
app.use('/Track/New', Track_Add_cnxt)
app.use('/Track/Query',Track_Get_cnxt)
app.use('/Track/Progress',Track_Prog_cnxt)
app.use('/Track/Survey',Track_Survey_cnxt)
app.use('/Track/Orientation',Track_Orientation_cnxt)
app.use('/Orientation/Campus', AllCampus_cnxt)
app.use('/Orientation/Question',SurvQuestion_cnxt)

//context to blog entities
app.use('/Blog/blog', Blog_cnxt);

//Publisize a folder
app.use(express.static('public')); 
app.use('/images', express.static('bin/images'));
app.use('/videos', express.static('bin/videos'));


app.listen(GRAPH_PORT, (e) => {
    console.log("********************************************************");
    console.log("* DB: "+DATABASE()+":3306 DBname:'orientation_db_schema'    *");
    console.log("*    (Shezi)        Backend API REST     (Cheyeza)     *");
    console.log("*                   PORT : "+GRAPH_PORT+"                        *");
    console.log("********************************************************");

});


