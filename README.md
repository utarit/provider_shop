# Provider Architecture

In this blog post I talked about Provider package and it's usage as a state management. 

The subjects I talked about are
* Notifiers
	* ChangeNotifier
	* ValueNotifier
* Providers
	* Provider (Base Class)
	* ChaneNotifierProvider
	* MultiProvider
	* StreamProvider
	* FutureProvider
* Consumers
	* Provider.of
	* Consumer
	* Selector

You can find individual code examples at my [gist](https://gist.github.com/utarit)

![Video](https://media.giphy.com/media/cNN7K8QMlPN8XsxaSF/giphy.gif)

This project is a sample usecases of some the provider, notifier and consumer examples. It contains two models which extends ChangeNotifier, UserModel and Cart Model. These models are provided via MultiProvider and consumed by Provider.of, Consumer and Selector.
