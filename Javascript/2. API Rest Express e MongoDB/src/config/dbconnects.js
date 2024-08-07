import mongoose from "mongoose";


async function conectaMongoDb() {
    mongoose.connect(process.env.MONGODB_CONNECTION_STRING);
    return mongoose.connection;
}

export default conectaMongoDb;
