![CodeShipBadge](https://codeship.com/projects/dfaa7ea0-6dc8-0134-6eb3-66a80b8b3db1/status?branch=master) [![Code Climate](https://codeclimate.com/github/jeremiahalex/rails-flea-circus/badges/gpa.svg)](https://codeclimate.com/github/jeremiahalex/rails-flea-circus) [![Test Coverage](https://codeclimate.com/github/jeremiahalex/rails-flea-circus/badges/coverage.svg)](https://codeclimate.com/github/jeremiahalex/rails-flea-circus/coverage)

# The Rails Flea Circus

- A Dog has_many fleas
- A Flea belongs_to a dog
- A User has_many circuses
- A Circus has_and_belongs_to_many fleas
- A Flea has_and_belongs_to_many circuses
- A Dog has_many circuses through it's fleas
- A Circus has_many dogs through it's fleas
- A Circus has an image stored on Cloudinary
- There are no cats
