# README

## Installation

### Prerequisites

```
# For image processing (resizing uploads)
brew install vips

# Make sure postgres is up and running.. may need
brew install postgresql@15
```

### Set up

```
git clone git@github.com:artfuldodger/cactustracker.git
cd cactustracker
bundle
rails db:create db:migrate db:test:prepare
```
