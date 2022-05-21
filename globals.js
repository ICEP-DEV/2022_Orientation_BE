//DB CRDS
const USERNAME = "admin";
const PASSWORD = "icep2020"
const DATABASE_HOSTNAME = "inst-orientation-db.cvqpj5ith2h1.us-east-1.rds.amazonaws.com";
//API PORTS
const HOSTNAME = "http://ec2-18-234-218-224.compute-1.amazonaws.com"
const SOCKETIO_PORT = process.env.PORT || 80;
const GRAPH_PORT = process.env.PORT || 80;
const APP_PORT = process.env.PORT || 80;


function DATABASE()
{ 
    if(DATABASE_HOSTNAME == 'localhost')
        return "localhost"
    else
        return "awshosted"

}

module.exports = {
    HOSTNAME,
    DATABASE_HOSTNAME,
    USERNAME,
    PASSWORD,
    SOCKETIO_PORT,
    GRAPH_PORT,
    APP_PORT,
    DATABASE
}