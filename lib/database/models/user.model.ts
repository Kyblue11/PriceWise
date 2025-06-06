import { Schema, model, models } from "mongoose";

const UserSchema = new Schema({
  clerkId: {
    type: String,
    required: true,
    unique: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  username: {
    type: String,
    required: true,
    unique: true,
  },
  tier: {
    type: Number,
    required: true,
  },
  premiumStartDate: {
    type: Date,
    required: false,
  },
  premiumEndDate: {
    type: Date,
    required: false,
  },
  photo: {
    type: String,
    required: true,
  },
});

const User = models.User || model("User", UserSchema);

export default User;
