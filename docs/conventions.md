# 🎯 Conventions

This is a series of patterns that we found useful to follow, because they make our code cleaner, our processes easier and our lives, happier. If you found that any of these could be improved, please present your proves to us, and after a good discussion, we update them!

Made with love by the_ **Monkslab** ❤️

## General

### Naming

- Prefix **custom** or **generic** widgets and app specific classes and with _app_: app_card. Keep the name of the file without the app.
- begin with **fetch** methods returning a **Future**
- begin with **watch** methods returning a **Stream**

### Flutter best practices

- Testing is not about coverage but about risks assessment
_A widget should be generic if could be used outside of a feature; it's custom when it could be used outside of a feature and needs additional functionalities than it's source class_
- use **stateless** widgets instead of functions
- pass **ids** instead of objects
- create **index** to avoid unnecessary imports
- prefer **map** instead _forEach_
- always choose [sizes](./lib/src/ui/sizes) instead of SizedBoxes
- remember to be responsive based on these [breakpoints](./lib/src/ui/breakpoints)
- Has no sense to test models using freezed; just test fromJson

## Specific Implementations

### Riverpod best practices

- like better **asyncVlaue** instead _futureBuilder_
- pick **ConsumerWidget** as default **if small**
- choose **AsyncValue.guard** before _try/catch_
- Never observe (.watch) controller inside build method > observe always state

### Go Router best practices

- create **routes in enum** and **navigate by name**
