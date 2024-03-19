.PHONY: clean pub-get build-runner

clean:
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@flutter clean

pub-get:
	@flutter pub get

runner:
	@flutter pub run build_runner build --delete-conflicting-outputs
build-apk:
	@flutter build apk --release