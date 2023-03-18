## Project Name
`RubyEditXcodeProj`

Use Ruby Script to edit the `xcodeproj` file dynamically.

## Usage

Firstly，you should make sure that your machine has installed the ruby environment.

``` shell
$ ruby -v
```

if you don't install ruby environment，you should install it first.

``` rb
$ brew install ruby
```

Than，installed the necessary library：'xcodeproj'

``` shell
$ gem install xcodeproj
```

Finally，run the file `updateProjSettings.rb`

``` ruby
$ ruby updateProjSettings.rb
```

you can edit the ruby file according to your requirements.You can follow this document：

[xcodeproj API](https://www.rubydoc.info/gems/xcodeproj/Xcodeproj/Project/Object)


