TITLE: Creating a New React Native Project with CLI
DESCRIPTION: This command initializes a new React Native project named 'AwesomeProject' using the latest version of the React Native Community CLI. It sets up the basic project structure and necessary dependencies for a barebones React Native application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/get-started-without-a-framework.md#_snippet_0

LANGUAGE: shell
CODE:

```
npx @react-native-community/cli@latest init AwesomeProject
```

---

TITLE: Creating a Basic 'Hello World' App in React Native
DESCRIPTION: This snippet presents a foundational 'Hello World' application built with React Native components. It demonstrates the use of `View` for structuring the layout and `Text` for displaying textual content, with basic styling to center the text. This example is specifically designed for interactive use within a SnackPlayer, enabling users to modify and observe the code's output in real-time.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/introduction.md#_snippet_0

LANGUAGE: React Native
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const YourApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Try editing me! 🎉</Text>
    </View>
  );
};

export default YourApp;
```

---

TITLE: Creating a Basic 'Hello World' App in React Native
DESCRIPTION: This snippet demonstrates a minimal React Native application that displays 'Hello, world!'. It imports `React` for JSX and `Text` and `View` components from `react-native`. The `HelloWorldApp` functional component renders a `View` container styled to center its content, which includes a `Text` component displaying the greeting.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/tutorial.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const HelloWorldApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Hello, world!</Text>
    </View>
  );
};
export default HelloWorldApp;
```

---

TITLE: Registering a Root Component with AppRegistry (TSX)
DESCRIPTION: This snippet demonstrates how to register a root React Native component using `AppRegistry.registerComponent`. It defines a simple functional component `App` and then registers it with a unique `appKey`, making it available for the native system to load and render. This is a fundamental step for any React Native application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/appregistry.md#_snippet_0

LANGUAGE: tsx
CODE:

```
import {Text, AppRegistry} from 'react-native';

const App = () => (
  <View>
    <Text>App1</Text>
  </View>
);

AppRegistry.registerComponent('Appname', () => App);
```

---

TITLE: Creating a Basic React Native Component
DESCRIPTION: This snippet defines a functional React Native component named `YourApp`. It renders a centered `Text` element within a `View`, displaying a simple message. This serves as a foundational example for building UI with React Native, demonstrating component structure and basic styling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/plugins/remark-snackplayer/tests/markdown/test1.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import { Text, View } from 'react-native';

const YourApp = () => {
    return (
    <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <Text>
        Try editing me! 🎉
        </Text>
    </View>
    );
}

export default YourApp;
```

---

TITLE: Installing a React Native Library
DESCRIPTION: This section demonstrates how to install a third-party library like `react-native-webview` into your React Native project using either npm or Yarn. This process adds the package to your `node_modules` and updates your `package.json`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/libraries.md#_snippet_0

LANGUAGE: shell
CODE:

```
npm install react-native-webview
```

LANGUAGE: shell
CODE:

```
yarn add react-native-webview
```

---

TITLE: Defining a Functional Component Structure
DESCRIPTION: This snippet illustrates the basic structure of a functional React component. It defines a constant `Cat` as an arrow function, which serves as the blueprint for the component. This function will eventually return a React element to be rendered.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/intro-react.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
const Cat = () => {};
```

---

TITLE: Complete React Native App Fetching Data (JavaScript)
DESCRIPTION: This is a full React Native component demonstrating data fetching with the Fetch API. It manages loading state, displays fetched data in a FlatList, and handles errors, using useEffect for data loading on component mount.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/network.md#_snippet_4

LANGUAGE: javascript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Implementing a Counter in React Native with useState Hook
DESCRIPTION: This snippet demonstrates a counter application in React Native using the `useState` hook for state management. It imports `View`, `Text`, `Button`, and `StyleSheet` from `react-native`. The `App` functional component manages a `count` state, displaying it with `Text` and providing a `Button` to increment it, styled using `StyleSheet` for layout.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/tutorial.md#_snippet_4

LANGUAGE: TypeScript
CODE:

```
import React, {useState} from 'react';
import {View, Text, Button, StyleSheet} from 'react-native';

const App = () => {
  const [count, setCount] = useState(0);

  return (
    <View style={styles.container}>
      <Text>You clicked {count} times</Text>
      <Button
        onPress={() => setCount(count + 1)}
        title="Click me!"
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
```

---

TITLE: Creating a New React Native Project (CLI)
DESCRIPTION: This command initializes a new React Native project named 'AwesomeProject' using the latest stable version of the React Native CLI via `npx`. It sets up the basic project structure and dependencies required for a React Native application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/_getting-started-macos-android.md#_snippet_4

LANGUAGE: shell
CODE:

```
npx react-native@latest init AwesomeProject
```

---

TITLE: Creating a Basic React Native Component
DESCRIPTION: This snippet demonstrates how to define a simple functional React Native component named `Cat`. It imports `React` and `Text` from `react-native`, and returns a `Text` element displaying a greeting. The component is then exported for use in other parts of the application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/intro-react.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const Cat = () => {
  return <Text>Hello, I am your cat!</Text>;
};

export default Cat;
```

---

TITLE: Implementing TouchableOpacity with State in React Native
DESCRIPTION: This example demonstrates how to use `TouchableOpacity` in a React Native application to create a pressable button that updates a counter. It utilizes `useState` for managing the count, `StyleSheet` for component styling, and `SafeAreaView` for proper layout within safe areas. The `onPress` prop of `TouchableOpacity` is used to trigger the counter increment.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/touchableopacity.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React, {useState} from 'react';
import {StyleSheet, Text, TouchableOpacity, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [count, setCount] = useState(0);
  const onPress = () => setCount(prevCount => prevCount + 1);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={styles.countContainer}>
          <Text>Count: {count}</Text>
        </View>
        <TouchableOpacity style={styles.button} onPress={onPress}>
          <Text>Press Here</Text>
        </TouchableOpacity>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 10,
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
  },
  countContainer: {
    alignItems: 'center',
    padding: 10,
  },
});

export default App;
```

---

TITLE: Passing and Using Props in React Components (TS)
DESCRIPTION: This TypeScript snippet illustrates passing and utilizing `props` with type annotations to customize child components. A `CatProps` type defines the `name` prop, ensuring type safety when the `Cafe` component passes different names to each `Cat` instance.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/intro-react.md#_snippet_11

LANGUAGE: typescript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

type CatProps = {
  name: string;
};

const Cat = (props: CatProps) => {
  return (
    <View>
      <Text>Hello, I am {props.name}!</Text>
    </View>
  );
};

const Cafe = () => {
  return (
    <View>
      <Cat name="Maru" />
      <Cat name="Jellylorum" />
      <Cat name="Spot" />
    </View>
  );
};

export default Cafe;
```

---

TITLE: Implementing TouchableOpacity with Functional Component in React Native
DESCRIPTION: This snippet demonstrates how to use `TouchableOpacity` within a React Native functional component. It sets up a simple counter that increments on each press, showcasing state management with `useState` and basic styling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/touchableopacity.md#_snippet_0

LANGUAGE: React Native
CODE:

```
import React, {useState} from 'react';
import {StyleSheet, Text, TouchableOpacity, View} from 'react-native';

const App = () => {
  const [count, setCount] = useState(0);
  const onPress = () => setCount(prevCount => prevCount + 1);

  return (
    <View style={styles.container}>
      <View style={styles.countContainer}>
        <Text>Count: {count}</Text>
      </View>
      <TouchableOpacity style={styles.button} onPress={onPress}>
        <Text>Press Here</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 10,
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
  },
  countContainer: {
    alignItems: 'center',
    padding: 10,
  },
});

export default App;
```

---

TITLE: Defining Styles with StyleSheet.create in React Native
DESCRIPTION: This React Native example demonstrates how to define and apply multiple styles using `StyleSheet.create`. It shows how to create a `StyleSheet` object with various style rules (e.g., `container`, `bigBlue`, `red`) and apply them to `Text` and `View` components. The snippet also illustrates style precedence when an array of styles is passed to the `style` prop, where the last style in the array takes precedence.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/style.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {StyleSheet, Text, View} from 'react-native';

const LotsOfStyles = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.red}>just red</Text>
      <Text style={styles.bigBlue}>just bigBlue</Text>
      <Text style={[styles.bigBlue, styles.red]}>bigBlue, then red</Text>
      <Text style={[styles.red, styles.bigBlue]}>red, then bigBlue</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    marginTop: 50,
  },
  bigBlue: {
    color: 'blue',
    fontWeight: 'bold',
    fontSize: 30,
  },
  red: {
    color: 'red',
  },
});

export default LotsOfStyles;
```

---

TITLE: Implementing Flex Basis, Grow, and Shrink in React Native
DESCRIPTION: This React Native example demonstrates the usage of `flexBasis`, `flexGrow`, and `flexShrink` properties to control the size and distribution of child components within a Flexbox container. It allows users to dynamically adjust these values for three different boxes, showcasing their impact on layout. The `BoxInfo` component provides interactive input fields for modifying the flex properties, while the `App` component renders the boxes and applies the styles.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/flexbox.md#_snippet_8

LANGUAGE: JavaScript
CODE:

```
import React, { useState } from "react";
import {
  View,
  Text,
  TextInput,
  StyleSheet,
} from "react-native";

const App = () => {
  const [powderblue, setPowderblue] = useState({
    flexGrow: 0,
    flexShrink: 1,
    flexBasis: "auto",
  });
  const [skyblue, setSkyblue] = useState({
    flexGrow: 1,
    flexShrink: 0,
    flexBasis: 100,
  });
  const [steelblue, setSteelblue] = useState({
    flexGrow: 0,
    flexShrink: 1,
    flexBasis: 200,
  });
  return (
    <View style={styles.container}>
      <View
        style={[
          styles.container,
          {
            flexDirection: "row",
            alignContent: "space-between",
          },
        ]}
      >
        <BoxInfo
          color="powderblue"
          {...powderblue}
          setStyle={setPowderblue}
        />
        <BoxInfo
          color="skyblue"
          {...skyblue}
          setStyle={setSkyblue}
        />
        <BoxInfo
          color="steelblue"
          {...steelblue}
          setStyle={setSteelblue}
        />
      </View>
      <View style={styles.previewContainer}>
        <View
          style={[
            styles.box,
            {
              flexBasis: powderblue.flexBasis,
              flexGrow: powderblue.flexGrow,
              flexShrink: powderblue.flexShrink,
              backgroundColor: "powderblue",
            },
          ]}
        />
        <View
          style={[
            styles.box,
            {
              flexBasis: skyblue.flexBasis,
              flexGrow: skyblue.flexGrow,
              flexShrink: skyblue.flexShrink,
              backgroundColor: "skyblue",
            },
          ]}
        />
        <View
          style={[
            styles.box,
            {
              flexBasis: steelblue.flexBasis,
              flexGrow: steelblue.flexGrow,
              flexShrink: steelblue.flexShrink,
              backgroundColor: "steelblue",
            },
          ]}
        />
      </View>
    </View>
  );
};

const BoxInfo = ({
  color,
  flexBasis,
  flexShrink,
  setStyle,
  flexGrow,
}) => (
  <View style={[styles.row, { flexDirection: "column" }]}>
    <View
      style={[
        styles.boxLabel,
        {
          backgroundColor: color,
        },
      ]}
    >
      <Text
        style={{
          color: "#fff",
          fontWeight: "500",
          textAlign: "center",
        }}
      >
        Box
      </Text>
    </View>
    <Text style={styles.label}>flexBasis</Text>
    <TextInput
      value={flexBasis}
      style={styles.input}
      onChangeText={(fB) =>
        setStyle((value) => ({
          ...value,
          flexBasis: isNaN(parseInt(fB))
            ? "auto"
            : parseInt(fB),
        }))
      }
    />
    <Text style={styles.label}>flexShrink</Text>
    <TextInput
      value={flexShrink}
      style={styles.input}
      onChangeText={(fS) =>
        setStyle((value) => ({
          ...value,
          flexShrink: isNaN(parseInt(fS))
            ? ""
            : parseInt(fS),
        }))
      }
    />
    <Text style={styles.label}>flexGrow</Text>
    <TextInput
      value={flexGrow}
      style={styles.input}
      onChangeText={(fG) =>
        setStyle((value) => ({
          ...value,
          flexGrow: isNaN(parseInt(fG))
            ? ""
            : parseInt(fG),
        }))
      }
    />
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 10,
  },
  box: {
    flex: 1,
    height: 50,
    width: 50,
  },
  boxLabel: {
    minWidth: 80,
    padding: 8,
    borderRadius: 4,
    marginTop: 8,
  },
  label: {
    marginTop: 6,
    fontSize: 16,
    fontWeight: "100",
  },
  previewContainer: {
    flex: 1,
    flexDirection: "row",
    backgroundColor: "aliceblue",
  },
  row: {
    flex: 1,
    flexDirection: "row",
    flexWrap: "wrap",
    alignItems: "center",
    marginBottom: 10,
  },
  input: {
    borderBottomWidth: 1,
    paddingVertical: 3,
    width: 50,
    textAlign: "center",
  },
});

export default App;
```

---

TITLE: Defining and Applying Styles with StyleSheet.create in React Native
DESCRIPTION: This snippet demonstrates how to define and apply styles in React Native using `StyleSheet.create`. It shows how to create a style object with multiple named styles and apply them to `Text` and `View` components. It also illustrates applying multiple styles using an array, where the last style in the array takes precedence, and exports the component for use.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/style.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React from 'react';
import { StyleSheet, Text, View } from 'react-native';

const LotsOfStyles = () => {
    return (
      <View style={styles.container}>
        <Text style={styles.red}>just red</Text>
        <Text style={styles.bigBlue}>just bigBlue</Text>
        <Text style={[styles.bigBlue, styles.red]}>bigBlue, then red</Text>
        <Text style={[styles.red, styles.bigBlue]}>red, then bigBlue</Text>
      </View>
    );
};

const styles = StyleSheet.create({
  container: {
    marginTop: 50,
  },
  bigBlue: {
    color: 'blue',
    fontWeight: 'bold',
    fontSize: 30,
  },
  red: {
    color: 'red',
  },
});

export default LotsOfStyles;
```

---

TITLE: Rendering a Simple FlatList in React Native
DESCRIPTION: This example demonstrates the basic usage of React Native's FlatList component to render a static list of items. It defines a data array, a functional component for rendering individual items, and then uses FlatList with `data`, `renderItem`, and `keyExtractor` props to display the list. It also includes basic styling using StyleSheet.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/flatlist.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {View, FlatList, StyleSheet, Text, StatusBar} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const DATA = [
  {
    id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28ba',
    title: 'First Item',
  },
  {
    id: '3ac68afc-c605-48d3-a4f8-fbd91aa97f63',
    title: 'Second Item',
  },
  {
    id: '58694a0f-3da1-471f-bd96-145571e29d72',
    title: 'Third Item',
  },
];

const Item = ({title}) => (
  <View style={styles.item}>
    <Text style={styles.title}>{title}</Text>
  </View>
);

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <FlatList
        data={DATA}
        renderItem={({item}) => <Item title={item.title} />}
        keyExtractor={item => item.id}
      />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: StatusBar.currentHeight || 0,
  },
  item: {
    backgroundColor: '#f9c2ff',
    padding: 20,
    marginVertical: 8,
    marginHorizontal: 16,
  },
  title: {
    fontSize: 32,
  },
});

export default App;
```

LANGUAGE: typescript
CODE:

```
import React from 'react';
import {View, FlatList, StyleSheet, Text, StatusBar} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const DATA = [
  {
    id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28ba',
    title: 'First Item',
  },
  {
    id: '3ac68afc-c605-48d3-a4f8-fbd91aa97f63',
    title: 'Second Item',
  },
  {
    id: '58694a0f-3da1-471f-bd96-145571e29d72',
    title: 'Third Item',
  },
];

type ItemProps = {title: string};

const Item = ({title}: ItemProps) => (
  <View style={styles.item}>
    <Text style={styles.title}>{title}</Text>
  </View>
);

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <FlatList
        data={DATA}
        renderItem={({item}) => <Item title={item.title} />}
        keyExtractor={item => item.id}
      />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: StatusBar.currentHeight || 0,
  },
  item: {
    backgroundColor: '#f9c2ff',
    padding: 20,
    marginVertical: 8,
    marginHorizontal: 16,
  },
  title: {
    fontSize: 32,
  },
});

export default App;
```

---

TITLE: Importing React and React Native Core Components
DESCRIPTION: This snippet demonstrates how to import the `React` library and the `Text` Core Component from `react-native`. These imports are essential for creating React components and utilizing React Native's built-in UI elements.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/intro-react.md#_snippet_1

LANGUAGE: typescript
CODE:

```
import React from 'react';
import {Text} from 'react-native';
```

---

TITLE: Implementing a Counter with React Native Hooks
DESCRIPTION: This snippet showcases a counter application built with React Native functional components and the `useState` hook. It uses `View`, `Text`, and `Button` components, demonstrating how state is managed identically to ReactJS, but rendered with native UI elements and styled using `StyleSheet`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/tutorial.md#_snippet_4

LANGUAGE: TypeScript
CODE:

```
// React Native Counter Example using Hooks!

import React, {useState} from 'react';
import {View, Text, Button, StyleSheet} from 'react-native';

const App = () => {
  const [count, setCount] = useState(0);

  return (
    <View style={styles.container}>
      <Text>You clicked {count} times</Text>
      <Button
        onPress={() => setCount(count + 1)}
        title="Click me!"
      />
    </View>
  );
};

// React Native Styles
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
```

---

TITLE: Interactive Layout Properties Example in JavaScript
DESCRIPTION: This React Native JavaScript example demonstrates dynamic manipulation of Flexbox layout properties. Users can change `flexDirection`, `justifyContent`, `alignItems`, `direction`, and `flexWrap` via buttons, and add/remove squares to observe real-time layout changes. It uses `useState` for state management and `StyleSheet` for styling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/layout-props.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {Button, ScrollView, StyleSheet, Text, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [flexDirection, setFlexDirection] = useState(0);
  const [justifyContent, setJustifyContent] = useState(0);
  const [alignItems, setAlignItems] = useState(0);
  const [direction, setDirection] = useState(0);
  const [wrap, setWrap] = useState(0);

  const [squares, setSquares] = useState([<Square />, <Square />, <Square />]);

  const hookedStyles = {
    flexDirection: flexDirections[flexDirection],
    justifyContent: justifyContents[justifyContent],
    alignItems: alignItemsArr[alignItems],
    direction: directions[direction],
    flexWrap: wraps[wrap],
  };

  const changeSetting = (value, options, setterFunction) => {
    if (value === options.length - 1) {
      setterFunction(0);
      return;
    }
    setterFunction(value + 1);
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={[styles.container, styles.playingSpace, hookedStyles]}>
          {squares.map(elem => elem)}
        </View>
        <ScrollView style={styles.layoutContainer}>
          <View style={styles.controlSpace}>
            <View style={styles.buttonView}>
              <Button
                title="Change Flex Direction"
                onPress={() =>
                  changeSetting(flexDirection, flexDirections, setFlexDirection)
                }
              />
              <Text style={styles.text}>{flexDirections[flexDirection]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Justify Content"
                onPress={() =>
                  changeSetting(
                    justifyContent,
                    justifyContents,
                    setJustifyContent,
                  )
                }
              />
              <Text style={styles.text}>{justifyContents[justifyContent]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Align Items"
                onPress={() =>
                  changeSetting(alignItems, alignItemsArr, setAlignItems)
                }
              />
              <Text style={styles.text}>{alignItemsArr[alignItems]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Direction"
                onPress={() =>
                  changeSetting(direction, directions, setDirection)
                }
              />
              <Text style={styles.text}>{directions[direction]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Flex Wrap"
                onPress={() => changeSetting(wrap, wraps, setWrap)}
              />
              <Text style={styles.text}>{wraps[wrap]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Add Square"
                onPress={() => setSquares([...squares, <Square />])}
              />
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Delete Square"
                onPress={() =>
                  setSquares(squares.filter((v, i) => i !== squares.length - 1))
                }
              />
            </View>
          </View>
        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const flexDirections = ['row', 'row-reverse', 'column', 'column-reverse'];
const justifyContents = [
  'flex-start',
  'flex-end',
  'center',
  'space-between',
  'space-around',
  'space-evenly',
];
const alignItemsArr = [
  'flex-start',
  'flex-end',
  'center',
  'stretch',
  'baseline',
];
const wraps = ['nowrap', 'wrap', 'wrap-reverse'];
const directions = ['inherit', 'ltr', 'rtl'];

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  layoutContainer: {
    flex: 0.5,
  },
  playingSpace: {
    backgroundColor: 'white',
    borderColor: 'blue',
    borderWidth: 3,
    overflow: 'hidden',
  },
  controlSpace: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  buttonView: {
    width: '50%',
    padding: 10,
  },
  text: {
    textAlign: 'center',
  },
});

const Square = () => (
  <View
    style={{
      width: 50,
      height: 50,
      backgroundColor: randomHexColor(),
    }}
  />
);

const randomHexColor = () => {
  return '#000000'.replace(/0/g, () => {
    return Math.round(Math.random() * 14).toString(16);
  });
};

export default App;
```

---

TITLE: Complete Fetch Data Display Example in React Native (TS)
DESCRIPTION: This comprehensive TypeScript example demonstrates fetching data from an API, managing loading states with 'useState', and displaying the results in a 'FlatList'. It includes a 'Movie' type definition for strong typing and uses 'useEffect' to initiate the fetch operation on component mount.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/network.md#_snippet_5

LANGUAGE: typescript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

type Movie = {
  id: string;
  title: string;
  releaseYear: string;
};

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState<Movie[]>([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Extracting Unique Key for List Items (TypeScript)
DESCRIPTION: This function is used to generate a unique key for each item in the list, based on the item data and its index. The key is crucial for React's reconciliation process, enabling efficient tracking of item re-ordering and caching. By default, it attempts to use item.key or item.id before falling back to the item's index.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/virtualizedlist.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
(item: any, index: number) => string;
```

---

TITLE: Declaring State Variable with useState in React Functional Components
DESCRIPTION: This code demonstrates how to declare a state variable `isHungry` and its corresponding setter function `setIsHungry` using the `useState` Hook. The initial value for `isHungry` is set to `true`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/intro-react.md#_snippet_18

LANGUAGE: JSX
CODE:

```
const Cat = props => {
  const [isHungry, setIsHungry] = useState(true);
  // ...
};
```

---

TITLE: Creating a New React Native Project
DESCRIPTION: This command uses `npx` to execute the latest stable version of the React Native CLI without global installation, initializing a new React Native project named 'AwesomeProject' in the current directory.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/_getting-started-windows-android.md#_snippet_4

LANGUAGE: shell
CODE:

```
npx react-native@latest init AwesomeProject
```

---

TITLE: Controlling Flex Direction in React Native (TypeScript)
DESCRIPTION: This React Native component, written in TypeScript, demonstrates the `flexDirection` property, which defines the main axis for laying out child components. It allows users to dynamically switch between `column`, `row`, `column-reverse`, and `row-reverse` values, visually showcasing how children are arranged. The `PreviewLayout` helper component, with explicit type definitions for its props, manages the UI for selecting `flexDirection` values and rendering the children accordingly.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/flexbox.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
import React, {useState} from 'react';
import {StyleSheet, Text, TouchableOpacity, View} from 'react-native';
import type {PropsWithChildren} from 'react';

const FlexDirectionBasics = () => {
  const [flexDirection, setflexDirection] = useState('column');

  return (
    <PreviewLayout
      label="flexDirection"
      values={['column', 'row', 'column-reverse', 'row-reverse']}
      selectedValue={flexDirection}
      setSelectedValue={setflexDirection}>
      <View style={[styles.box, {backgroundColor: 'powderblue'}]} />
      <View style={[styles.box, {backgroundColor: 'skyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'steelblue'}]} />
    </PreviewLayout>
  );
};

type PreviewLayoutProps = PropsWithChildren<{
  label: string;
  values: string[];
  selectedValue: string;
  setSelectedValue: (value: string) => void;
}>;

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}: PreviewLayoutProps) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default FlexDirectionBasics;
```

---

TITLE: Creating Expo React Native Project (npm)
DESCRIPTION: This command initializes a new React Native project named "AwesomeProject" using Expo CLI via npm, then navigates into the project directory and starts the development server. It requires Node.js and npm to be installed as prerequisites.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/getting-started.md#_snippet_0

LANGUAGE: shell
CODE:

```
npx create-expo-app AwesomeProject

cd AwesomeProject
npm start # you can also use: npx expo start
```

---

TITLE: Implementing Blinking Text with React Native Hooks (JavaScript)
DESCRIPTION: This snippet demonstrates how to create a blinking text component in React Native using functional components. It utilizes the `useState` hook to manage the `isShowingText` boolean state, which controls the visibility of the text. The `useEffect` hook is used to set up a `setInterval` that toggles `isShowingText` every second, and also provides a cleanup function to clear the interval when the component unmounts. The `BlinkApp` component then renders multiple instances of the `Blink` component, each with different text props.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/state.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React, {useState, useEffect} from 'react';
import {Text, View} from 'react-native';

const Blink = props => {
  const [isShowingText, setIsShowingText] = useState(true);

  useEffect(() => {
    const toggle = setInterval(() => {
      setIsShowingText(!isShowingText);
    }, 1000);

    return () => clearInterval(toggle);
  });

  if (!isShowingText) {
    return null;
  }

  return <Text>{props.text}</Text>;
};

const BlinkApp = () => {
  return (
    <View style={{marginTop: 50}}>
      <Blink text="I love to blink" />
      <Blink text="Yes blinking is so great" />
      <Blink text="Why did they ever take this out of HTML" />
      <Blink text="Look at me look at me look at me" />
    </View>
  );
};

export default BlinkApp;
```

---

TITLE: Using Props with Functional Components in React Native (JavaScript)
DESCRIPTION: This example illustrates how to use `props` to customize functional components in React Native. The `Greeting` component accepts a `name` prop to display personalized greetings. It also demonstrates `StyleSheet.create` for defining reusable styles and how to apply multiple styles to a component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/tutorial.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View, StyleSheet} from 'react-native';

const styles = StyleSheet.create({
  center: {
    alignItems: 'center',
  },
});

const Greeting = props => {
  return (
    <View style={styles.center}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={[styles.center, {top: 50}]}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Basic LayoutAnimation Usage with Presets (React Native)
DESCRIPTION: This example demonstrates how to use `LayoutAnimation.configureNext` with `LayoutAnimation.Presets.spring` to automatically animate layout changes in a React Native functional component. When the `TouchableOpacity` is pressed, the `expanded` state is toggled, and `LayoutAnimation` animates the appearance or disappearance of the `View` with a spring effect. The Android setup for `UIManager` is also included for cross-platform compatibility.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/layoutanimation.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React, {useState} from 'react';
import {
  LayoutAnimation,
  Platform,
  StyleSheet,
  Text,
  TouchableOpacity,
  UIManager,
  View,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

if (
  Platform.OS === 'android' &&
  UIManager.setLayoutAnimationEnabledExperimental
) {
  UIManager.setLayoutAnimationEnabledExperimental(true);
}
const App = () => {
  const [expanded, setExpanded] = useState(false);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={style.container}>
        <TouchableOpacity
          onPress={() => {
            LayoutAnimation.configureNext(LayoutAnimation.Presets.spring);
            setExpanded(!expanded);
          }}>
          <Text>Press me to {expanded ? 'collapse' : 'expand'}!</Text>
        </TouchableOpacity>
        {expanded && (
          <View style={style.tile}>
            <Text>I disappear sometimes!</Text>
          </View>
        )}
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const style = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    gap: 16,
  },
  tile: {
    backgroundColor: 'lightgrey',
    borderWidth: 0.5,
    borderColor: '#d6d7da',
    padding: 4,
  },
});

export default App;
```

---

TITLE: Registering React Native Component in index.js (JavaScript)
DESCRIPTION: This JavaScript code defines the entry point for a React Native application. It imports `AppRegistry` from `react-native` and the root `App` component, then registers `App` as the main component for the application named 'HelloWorld'. This `index.js` file is always required as the starting point for React Native applications.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/_integration-with-existing-apps-kotlin.md#_snippet_9

LANGUAGE: javascript
CODE:

```
import {AppRegistry} from 'react-native';
import App from './App';

AppRegistry.registerComponent('HelloWorld', () => App);
```

---

TITLE: Initializing a New Expo React Native Project (Shell)
DESCRIPTION: This command uses `npx` to execute the `create-expo-app` package, which initializes a new React Native project configured with the Expo framework. It sets up the project structure, installs dependencies, and prepares the environment for developing a production-ready React Native application using Expo's tooling and standard libraries.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/getting-started.md#_snippet_0

LANGUAGE: shell
CODE:

```
npx create-expo-app@latest
```

---

TITLE: Correct Text Node Placement within React Native View
DESCRIPTION: This snippet demonstrates the correct way to include text content within a `<View>` component in React Native. All text must be explicitly wrapped inside a `<Text>` component, adhering to React Native's strict text rendering rules.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/text.md#_snippet_5

LANGUAGE: JSX
CODE:

```
// GOOD
<View>
  <Text>
    Some text
  </Text>
</View>
```

---

TITLE: Complete Fetch Data Example in React Native (TypeScript)
DESCRIPTION: This TypeScript-enabled React Native component demonstrates fetching data from an API and displaying it in a FlatList, including type definitions for the fetched data. It uses useState for managing loading state and typed data, useEffect to initiate the fetch operation on component mount, and async/await for handling the asynchronous network request and JSON parsing.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/network.md#_snippet_5

LANGUAGE: TypeScript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

type Movie = {
  id: string;
  title: string;
  releaseYear: string;
};

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState<Movie[]>([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Complete Fetch Data Display Example in React Native (JavaScript)
DESCRIPTION: A full React Native component demonstrating data fetching from an API, managing loading states with useState, and displaying the fetched data in a FlatList. It uses useEffect to initiate the fetch operation on component mount.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/network.md#_snippet_4

LANGUAGE: javascript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Complete Fetch Data Example in React Native (JavaScript)
DESCRIPTION: This comprehensive React Native component demonstrates fetching data from an API using Fetch, managing loading states with `useState`, and rendering the fetched data in a `FlatList`. It includes `useEffect` to trigger the data fetch on component mount and an `ActivityIndicator` for user feedback during loading.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/network.md#_snippet_4

LANGUAGE: JavaScript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Registering an App Component (TSX)
DESCRIPTION: This method registers a React Native component with the `AppRegistry` using a unique `appKey` and a `ComponentProvider` function. An optional `section` boolean can be provided to indicate if it's a section component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/appregistry.md#_snippet_7

LANGUAGE: tsx
CODE:

```
static registerComponent(
  appKey: string,
  getComponentFunc: ComponentProvider,
  section?: boolean,
): string;
```

---

TITLE: Navigating Between Screens with Parameters (React Native)
DESCRIPTION: This TypeScript/React snippet demonstrates how to navigate between screens and pass parameters. The `HomeScreen` uses `navigation.navigate('Profile', {name: 'Jane'})` to transition to the 'Profile' screen, sending a `name` parameter. The `ProfileScreen` then accesses this parameter via `route.params.name` to display dynamic content, illustrating inter-screen data transfer.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/navigation.md#_snippet_6

LANGUAGE: typescript
CODE:

```
const HomeScreen = ({navigation}) => {
  return (
    <Button
      title="Go to Jane's profile"
      onPress={() =>
        navigation.navigate('Profile', {name: 'Jane'})
      }
    />
  );
};
const ProfileScreen = ({navigation, route}) => {
  return <Text>This is {route.params.name}'s profile</Text>;
};
```

---

TITLE: Implementing Pull-to-Refresh with RefreshControl in React Native
DESCRIPTION: This example demonstrates how to integrate `RefreshControl` into a `ScrollView` to provide pull-to-refresh functionality. It uses `useState` to manage the `refreshing` state and `useCallback` for the `onRefresh` handler, which simulates a data refresh with a timeout. The `RefreshControl` component is passed as a prop to the `ScrollView`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/refreshcontrol.md#_snippet_0

LANGUAGE: React Native
CODE:

```
import React from 'react';
import {RefreshControl, ScrollView, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [refreshing, setRefreshing] = React.useState(false);

  const onRefresh = React.useCallback(() => {
    setRefreshing(true);
    setTimeout(() => {
      setRefreshing(false);
    }, 2000);
  }, []);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <ScrollView
          contentContainerStyle={styles.scrollView}
          refreshControl={
            <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
          }>
          <Text>Pull down to see RefreshControl indicator</Text>
        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  scrollView: {
    flex: 1,
    backgroundColor: 'pink',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;
```

---

TITLE: Creating a Basic React Native 'Hello World' App with SnackPlayer
DESCRIPTION: This snippet demonstrates a fundamental 'Hello World' application built with React Native components, specifically `Text` and `View`. It's designed to be run within a SnackPlayer, allowing users to interactively edit and observe the rendering of the code directly in their browser. The example showcases basic UI structure and inline styling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/introduction.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const YourApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Try editing me! 🎉</Text>
    </View>
  );
};

export default YourApp;
```

---

TITLE: Passing and Using Props in React Components (JS)
DESCRIPTION: This JavaScript example demonstrates how to pass `props` to a React component and use them to customize its rendering. The `Cafe` component passes a different `name` prop to each `Cat` instance, allowing each cat to display a unique name.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/intro-react.md#_snippet_10

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const Cat = props => {
  return (
    <View>
      <Text>Hello, I am {props.name}!</Text>
    </View>
  );
};

const Cafe = () => {
  return (
    <View>
      <Cat name="Maru" />
      <Cat name="Jellylorum" />
      <Cat name="Spot" />
    </View>
  );
};

export default Cafe;
```

---

TITLE: Implementing KeyboardAvoidingView in React Native
DESCRIPTION: This example demonstrates the basic usage of KeyboardAvoidingView to ensure a TextInput remains visible when the software keyboard appears. It sets the 'behavior' prop conditionally for iOS ('padding') and Android ('height') and includes a TouchableWithoutFeedback component to dismiss the keyboard when the user taps outside the input area. The snippet also defines a StyleSheet for component styling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/keyboardavoidingview.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {
  View,
  KeyboardAvoidingView,
  TextInput,
  StyleSheet,
  Text,
  Platform,
  TouchableWithoutFeedback,
  Button,
  Keyboard,
} from 'react-native';

const KeyboardAvoidingComponent = () => {
  return (
    <KeyboardAvoidingView
      behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
      style={styles.container}>
      <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
        <View style={styles.inner}>
          <Text style={styles.header}>Header</Text>
          <TextInput placeholder="Username" style={styles.textInput} />
          <View style={styles.btnContainer}>
            <Button title="Submit" onPress={() => null} />
          </View>
        </View>
      </TouchableWithoutFeedback>
    </KeyboardAvoidingView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  inner: {
    padding: 24,
    flex: 1,
    justifyContent: 'space-around',
  },
  header: {
    fontSize: 36,
    marginBottom: 48,
  },
  textInput: {
    height: 40,
    borderColor: '#000000',
    borderBottomWidth: 1,
    marginBottom: 36,
  },
  btnContainer: {
    backgroundColor: 'white',
    marginTop: 12,
  },
});

export default KeyboardAvoidingComponent;
```

---

TITLE: Applying Basic View Styles in React Native
DESCRIPTION: This React Native snippet demonstrates how to apply various style properties to `View` components using `StyleSheet.create`. It showcases layout properties like `flex`, `justifyContent`, `padding`, and `margin`, alongside visual properties such as `backgroundColor`, `borderWidth`, and `borderRadius` to create a structured UI with distinct sections. It also integrates `SafeAreaView` and `SafeAreaProvider` for handling safe area insets.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/view-style-props.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <View style={styles.top} />
      <View style={styles.middle} />
      <View style={styles.bottom} />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-between',
    padding: 20,
    margin: 10,
  },
  top: {
    flex: 0.3,
    backgroundColor: 'grey',
    borderWidth: 5,
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
  },
  middle: {
    flex: 0.3,
    backgroundColor: 'beige',
    borderWidth: 5,
  },
  bottom: {
    flex: 0.3,
    backgroundColor: 'pink',
    borderWidth: 5,
    borderBottomLeftRadius: 20,
    borderBottomRightRadius: 20,
  },
});

export default App;
```

---

TITLE: Interactive Flexbox Layout Example in React Native
DESCRIPTION: This comprehensive React Native example demonstrates the dynamic application of various Flexbox layout properties. Users can interactively change `flexDirection`, `justifyContent`, `alignItems`, `direction`, and `flexWrap` values, and add/remove UI elements to observe real-time layout adjustments. It utilizes React hooks for state management and `StyleSheet` for styling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/layout-props.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {
  Button,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  View,
} from 'react-native';

const App = () => {
  const flexDirections = ['row', 'row-reverse', 'column', 'column-reverse'];
  const justifyContents = [
    'flex-start',
    'flex-end',
    'center',
    'space-between',
    'space-around',
    'space-evenly',
  ];
  const alignItemsArr = [
    'flex-start',
    'flex-end',
    'center',
    'stretch',
    'baseline',
  ];
  const wraps = ['nowrap', 'wrap', 'wrap-reverse'];
  const directions = ['inherit', 'ltr', 'rtl'];
  const [flexDirection, setFlexDirection] = useState(0);
  const [justifyContent, setJustifyContent] = useState(0);
  const [alignItems, setAlignItems] = useState(0);
  const [direction, setDirection] = useState(0);
  const [wrap, setWrap] = useState(0);

  const hookedStyles = {
    flexDirection: flexDirections[flexDirection],
    justifyContent: justifyContents[justifyContent],
    alignItems: alignItemsArr[alignItems],
    direction: directions[direction],
    flexWrap: wraps[wrap],
  };

  const changeSetting = (value, options, setterFunction) => {
    if (value === options.length - 1) {
      setterFunction(0);
      return;
    }
    setterFunction(value + 1);
  };
  const [squares, setSquares] = useState([<Square />, <Square />, <Square />]);
  return (
    <>
      <View style={{paddingTop: StatusBar.currentHeight}} />
      <View style={[styles.container, styles.playingSpace, hookedStyles]}>
        {squares.map(elem => elem)}
      </View>
      <ScrollView style={styles.container}>
        <View style={styles.controlSpace}>
          <View style={styles.buttonView}>
            <Button
              title="Change Flex Direction"
              onPress={() =>
                changeSetting(flexDirection, flexDirections, setFlexDirection)
              }
            />
            <Text style={styles.text}>{flexDirections[flexDirection]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Justify Content"
              onPress={() =>
                changeSetting(
                  justifyContent,
                  justifyContents,
                  setJustifyContent,
                )
              }
            />
            <Text style={styles.text}>{justifyContents[justifyContent]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Align Items"
              onPress={() =>
                changeSetting(alignItems, alignItemsArr, setAlignItems)
              }
            />
            <Text style={styles.text}>{alignItemsArr[alignItems]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Direction"
              onPress={() => changeSetting(direction, directions, setDirection)}
            />
            <Text style={styles.text}>{directions[direction]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Flex Wrap"
              onPress={() => changeSetting(wrap, wraps, setWrap)}
            />
            <Text style={styles.text}>{wraps[wrap]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Add Square"
              onPress={() => setSquares([...squares, <Square />])}
            />
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Delete Square"
              onPress={() =>
                setSquares(squares.filter((v, i) => i !== squares.length - 1))
              }
            />
          </View>
        </View>
      </ScrollView>
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    height: '50%',
  },
  playingSpace: {
    backgroundColor: 'white',
    borderColor: 'blue',
    borderWidth: 3,
  },
  controlSpace: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    backgroundColor: '#F5F5F5',
  },
  buttonView: {
    width: '50%',
    padding: 10,
  },
  text: {textAlign: 'center'},
});

const Square = () => (
  <View
    style={{
      width: 50,
      height: 50,
      backgroundColor: randomHexColor(),
    }}
  />
);

const randomHexColor = () => {
  return '#000000'.replace(/0/g, () => {
    return Math.round(Math.random() * 16).toString(16);
  });
};

export default App;
```

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {
  Button,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  View,
} from 'react-native';

const App = () => {
  const flexDirections = [
    'row',
    'row-reverse',
    'column',
    'column-reverse',
  ] as const;
  const justifyContents = [
    'flex-start',
    'flex-end',
    'center',
    'space-between',
    'space-around',
    'space-evenly',
  ] as const;
  const alignItemsArr = [
    'flex-start',
    'flex-end',
    'center',
    'stretch',
    'baseline',
  ] as const;
  const wraps = ['nowrap', 'wrap', 'wrap-reverse'] as const;
  const directions = ['inherit', 'ltr', 'rtl'] as const;
  const [flexDirection, setFlexDirection] = useState(0);
  const [justifyContent, setJustifyContent] = useState(0);
  const [alignItems, setAlignItems] = useState(0);
  const [direction, setDirection] = useState(0);
  const [wrap, setWrap] = useState(0);

  const hookedStyles = {
    flexDirection: flexDirections[flexDirection],
    justifyContent: justifyContents[justifyContent],
    alignItems: alignItemsArr[alignItems],
    direction: directions[direction],
    flexWrap: wraps[wrap],
  };

  const changeSetting = (
    value: number,
    options: readonly unknown[],
    setterFunction: (index: number) => void,
  ) => {
    if (value === options.length - 1) {
      setterFunction(0);
      return;
    }
    setterFunction(value + 1);
  };
  const [squares, setSquares] = useState([<Square />, <Square />, <Square />]);
  return (
    <>
      <View style={{paddingTop: StatusBar.currentHeight}} />
      <View style={[styles.container, styles.playingSpace, hookedStyles]}>
        {squares.map(elem => elem)}
      </View>
      <ScrollView style={styles.container}>
        <View style={styles.controlSpace}>
          <View style={styles.buttonView}>
            <Button
              title="Change Flex Direction"
              onPress={() =>
                changeSetting(flexDirection, flexDirections, setFlexDirection)
              }
            />
            <Text style={styles.text}>{flexDirections[flexDirection]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Justify Content"
              onPress={() =>
                changeSetting(
                  justifyContent,
                  justifyContents,
                  setJustifyContent,
                )
              }
            />
            <Text style={styles.text}>{justifyContents[justifyContent]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Align Items"
              onPress={() =>
                changeSetting(alignItems, alignItemsArr, setAlignItems)
              }
            />
            <Text style={styles.text}>{alignItemsArr[alignItems]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Direction"
              onPress={() => changeSetting(direction, directions, setDirection)}
            />
            <Text style={styles.text}>{directions[direction]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Flex Wrap"
              onPress={() => changeSetting(wrap, wraps, setWrap)}
            />
            <Text style={styles.text}>{wraps[wrap]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Add Square"
              onPress={() => setSquares([...squares, <Square />])}
            />
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Delete Square"
              onPress={() =>
                setSquares(squares.filter((v, i) => i !== squares.length - 1))
              }
            />
          </View>
        </View>
      </ScrollView>
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    height: '50%',
  },
  playingSpace: {
    backgroundColor: 'white',
    borderColor: 'blue',
    borderWidth: 3,
  },
  controlSpace: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    backgroundColor: '#F5F5F5',
  },
  buttonView: {
    width: '50%',
    padding: 10,
  },
  text: {textAlign: 'center'},
});

const Square = () => (
  <View
    style={{
      width: 50,
      height: 50,
      backgroundColor: randomHexColor(),
    }}
  />
);

const randomHexColor = () => {
  return '#000000'.replace(/0/g, () => {
    return Math.round(Math.random() * 16).toString(16);
  });
};

export default App;
```

---

TITLE: Running React Native App on Android Device/Emulator (CLI)
DESCRIPTION: This command builds and launches the React Native application on a connected Android device or an active Android emulator. It automates the process of compiling the native Android code and deploying the JavaScript bundle.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/_getting-started-macos-android.md#_snippet_7

LANGUAGE: shell
CODE:

```
npx react-native run-android
```

---

TITLE: Creating and Using Custom Components with Props in React Native
DESCRIPTION: This example illustrates how to create a reusable custom component, `Greeting`, that accepts a `name` prop. The `LotsOfGreetings` component then renders multiple instances of `Greeting`, passing different `name` values to each, demonstrating how `props` enable component customization and reuse. It also uses the `View` component for layout.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/props.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import { Text, View } from 'react-native';

const Greeting = (props) => {
    return (
      <View style={{alignItems: 'center'}}>
        <Text>Hello {props.name}!</Text>
      </View>
    );
}

export default LotsOfGreetings = () => {
    return (
      <View style={{alignItems: 'center', top: 50}}>
        <Greeting name='Rexxar' />
        <Greeting name='Jaina' />
        <Greeting name='Valeera' />
      </View>
    );
}
```

---

TITLE: Managing Keyboard Overlap with KeyboardAvoidingView in JavaScript
DESCRIPTION: This snippet demonstrates how to use `KeyboardAvoidingView` with `behavior='padding'` to automatically adjust the layout when the software keyboard appears, ensuring that input fields and action buttons remain visible. It includes a `TextInput` for email input and a 'Sign Up' button, showing how to manage focus and submit actions. Dependencies include `React`, `useState`, `useRef`, and several `react-native` components like `KeyboardAvoidingView`, `TextInput`, `Button`, `Alert`, `View`, `Text`, and `StyleSheet`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/improvingux.md#_snippet_2

LANGUAGE: javascript
CODE:

```
import React, {useState, useRef} from 'react';
import {
  Alert,
  Text,
  Button,
  StatusBar,
  TextInput,
  KeyboardAvoidingView,
  View,
  StyleSheet,
} from 'react-native';

const App = () => {
  const emailInput = useRef(null);
  const [email, setEmail] = useState('');

  const submit = () => {
    emailInput.current.blur();
    Alert.alert(`Confirmation email has been sent to ${email}`);
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      <View style={styles.header}>
        <Text style={styles.description}>
          This demo shows how to avoid covering important UI elements with the
          software keyboard. Focus the email input below and notice that the
          Sign Up button and the text adjusted positions to make sure they are
          not hidden under the keyboard.
        </Text>
      </View>
      <KeyboardAvoidingView behavior="padding" style={styles.form}>
        <TextInput
          style={styles.input}
          value={email}
          onChangeText={text => setEmail(text)}
          ref={emailInput}
          placeholder="email@example.com"
          autoCapitalize="none"
          autoCorrect={false}
          keyboardType="email-address"
          returnKeyType="send"
          onSubmitEditing={submit}
          blurOnSubmit={true}
        />
        <View>
          <Button title="Sign Up" onPress={submit} />
          <Text style={styles.legal}>Some important legal fine print here</Text>
        </View>
      </KeyboardAvoidingView>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    paddingTop: 64,
    padding: 20,
    backgroundColor: '#282c34',
  },
  description: {
    fontSize: 14,
    color: 'white',
  },
  input: {
    margin: 20,
    marginBottom: 0,
    height: 34,
    paddingHorizontal: 10,
    borderRadius: 4,
    borderColor: '#ccc',
    borderWidth: 1,
    fontSize: 16,
  },
  legal: {
    margin: 10,
    color: '#333',
    fontSize: 12,
    textAlign: 'center',
  },
  form: {
    flex: 1,
    justifyContent: 'space-between',
  },
});

export default App;
```

---

TITLE: Registering ReactWebViewPackage in React Native Android (Kotlin)
DESCRIPTION: This snippet demonstrates how to register the `ReactWebViewPackage` in a React Native Android application. It involves importing the package and adding an instance of `ReactWebViewPackage` to the list of `ReactPackage`s returned by the `getPackages` method in the `MainApplication.kt` file. This is a crucial step for the WebView module to be recognized and used by the React Native bridge.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/fabric-native-components-android.md#_snippet_6

LANGUAGE: Kotlin
CODE:

```
package com.demo

import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactApplication
import com.facebook.react.ReactHost
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.load
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost
import com.facebook.react.defaults.DefaultReactNativeHost
import com.facebook.react.soloader.OpenSourceMergedSoMapping
import com.facebook.soloader.SoLoader
// highlight-next-line
import com.webview.ReactWebViewPackage

class MainApplication : Application(), ReactApplication {

  override val reactNativeHost: ReactNativeHost =
      object : DefaultReactNativeHost(this) {
        override fun getPackages(): List<ReactPackage> =
            PackageList(this).packages.apply {
              // highlight-next-line
              add(ReactWebViewPackage())
            }

        override fun getJSMainModuleName(): String = "index"

        override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG

        override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
        override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
      }

  override val reactHost: ReactHost
    get() = getDefaultReactHost(applicationContext, reactNativeHost)

  override fun onCreate() {
    super.onCreate()
    SoLoader.init(this, OpenSourceMergedSoMapping)
    if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
      load()
    }
  }
}
```

---

TITLE: Demonstrating Flex Basis, Grow, and Shrink in React Native (TypeScript)
DESCRIPTION: This React Native example, written in TypeScript, demonstrates the interactive behavior of `flexBasis`, `flexGrow`, and `flexShrink` properties. It allows users to adjust these values for three different colored boxes and observe how they affect the layout within a flex container, leveraging TypeScript types for better code safety. The `BoxInfo` component provides input fields to modify the styles dynamically.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/flexbox.md#_snippet_16

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {View, Text, TextInput, StyleSheet} from 'react-native';
import type {ViewStyle} from 'react-native';

const App = () => {
  const [powderblue, setPowderblue] = useState<ViewStyle>({
    flexGrow: 0,
    flexShrink: 1,
    flexBasis: 'auto',
  });
  const [skyblue, setSkyblue] = useState<ViewStyle>({
    flexGrow: 1,
    flexShrink: 0,
    flexBasis: 100,
  });
  const [steelblue, setSteelblue] = useState<ViewStyle>({
    flexGrow: 0,
    flexShrink: 1,
    flexBasis: 200,
  });
  return (
    <View style={styles.container}>
      <View
        style={[
          styles.container,
          {
            flexDirection: 'row',
            alignContent: 'space-between',
          },
        ]}>
        <BoxInfo color="powderblue" {...powderblue} setStyle={setPowderblue} />
        <BoxInfo color="skyblue" {...skyblue} setStyle={setSkyblue} />
        <BoxInfo color="steelblue" {...steelblue} setStyle={setSteelblue} />
      </View>
      <View style={styles.previewContainer}>
        <View
          style={[
            styles.box,
            {
              flexBasis: powderblue.flexBasis,
              flexGrow: powderblue.flexGrow,
              flexShrink: powderblue.flexShrink,
              backgroundColor: 'powderblue',
            },
          ]}
        />
        <View
          style={[
            styles.box,
            {
              flexBasis: skyblue.flexBasis,
              flexGrow: skyblue.flexGrow,
              flexShrink: skyblue.flexShrink,
              backgroundColor: 'skyblue',
            },
          ]}
        />
        <View
          style={[
            styles.box,
            {
              flexBasis: steelblue.flexBasis,
              flexGrow: steelblue.flexGrow,
              flexShrink: steelblue.flexShrink,
              backgroundColor: 'steelblue',
            },
          ]}
        />
      </View>
    </View>
  );
};

type BoxInfoProps = ViewStyle & {
  color: string;
  setStyle: React.Dispatch<React.SetStateAction<ViewStyle>>;
};

const BoxInfo = ({
  color,
  flexBasis,
  flexShrink,
  setStyle,
  flexGrow,
}: BoxInfoProps) => (
  <View style={[styles.row, {flexDirection: 'column'}]}>
    <View
      style={[
        styles.boxLabel,
        {
          backgroundColor: color,
        },
      ]}>
      <Text
        style={{
          color: '#fff',
          fontWeight: '500',
          textAlign: 'center',
        }}>
        Box
      </Text>
    </View>
    <Text style={styles.label}>flexBasis</Text>
    <TextInput
      value={String(flexBasis)}
      style={styles.input}
      onChangeText={fB =>
        setStyle(value => ({
          ...value,
          flexBasis: isNaN(parseInt(fB, 10)) ? 'auto' : parseInt(fB, 10),
        }))
      }
    />
    <Text style={styles.label}>flexShrink</Text>
    <TextInput
      value={String(flexShrink)}
      style={styles.input}
      onChangeText={fS =>
        setStyle(value => ({
          ...value,
          flexShrink: isNaN(parseInt(fS, 10)) ? undefined : parseInt(fS, 10),
        }))
      }
    />
    <Text style={styles.label}>flexGrow</Text>
    <TextInput
      value={String(flexGrow)}
      style={styles.input}
      onChangeText={fG =>
        setStyle(value => ({
          ...value,
          flexGrow: isNaN(parseInt(fG, 10)) ? undefined : parseInt(fG, 10),
        }))
      }
    />
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 10,
  },
  box: {
    flex: 1,
    height: 50,
    width: 50,
  },
  boxLabel: {
    minWidth: 80,
    padding: 8,
    borderRadius: 4,
    marginTop: 8,
  },
  label: {
    marginTop: 6,
    fontSize: 16,
    fontWeight: '100',
  },
  previewContainer: {
    flex: 1,
    flexDirection: 'row',
    backgroundColor: 'aliceblue',
  },
  row: {
    flex: 1,
    flexDirection: 'row',
    flexWrap: 'wrap',
    alignItems: 'center',
    marginBottom: 10,
  },
  input: {
    borderBottomWidth: 1,
    paddingVertical: 3,
    width: 50,
    textAlign: 'center',
  },
});
```

---

TITLE: React Native Flexbox Layout Example in TypeScript
DESCRIPTION: This TypeScript React Native component `App` demonstrates various Flexbox layout properties (`flexDirection`, `justifyContent`, `alignItems`, `direction`, `flexWrap`). It uses `useState` hooks to manage layout settings and provides buttons to dynamically change these properties, visually updating the arrangement of `Square` components. It depends on `react-native` components and `react-native-safe-area-context` for safe area handling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/layout-props.md#_snippet_2

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {
  Button,
  ScrollView,
  StyleSheet,
  Text,
  View,
  FlexAlignType,
  FlexStyle,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [flexDirection, setFlexDirection] = useState(0);
  const [justifyContent, setJustifyContent] = useState(0);
  const [alignItems, setAlignItems] = useState(0);
  const [direction, setDirection] = useState(0);
  const [wrap, setWrap] = useState(0);

  const [squares, setSquares] = useState([<Square />, <Square />, <Square />]);

  const hookedStyles = {
    flexDirection: flexDirections[flexDirection],
    justifyContent: justifyContents[justifyContent],
    alignItems: alignItemsArr[alignItems],
    direction: directions[direction],
    flexWrap: wraps[wrap],
  } as FlexStyle;

  const changeSetting = (
    value: number,
    options: any[],
    setterFunction: (index: number) => void,
  ) => {
    if (value === options.length - 1) {
      setterFunction(0);
      return;
    }
    setterFunction(value + 1);
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={[styles.container, styles.playingSpace, hookedStyles]}>
          {squares.map(elem => elem)}
        </View>
        <ScrollView style={styles.layoutContainer}>
          <View style={styles.controlSpace}>
            <View style={styles.buttonView}>
              <Button
                title="Change Flex Direction"
                onPress={() =>
                  changeSetting(flexDirection, flexDirections, setFlexDirection)
                }
              />
              <Text style={styles.text}>{flexDirections[flexDirection]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Justify Content"
                onPress={() =>
                  changeSetting(
                    justifyContent,
                    justifyContents,
                    setJustifyContent,
                  )
                }
              />
              <Text style={styles.text}>{justifyContents[justifyContent]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Align Items"
                onPress={() =>
                  changeSetting(alignItems, alignItemsArr, setAlignItems)
                }
              />
              <Text style={styles.text}>{alignItemsArr[alignItems]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Direction"
                onPress={() =>
                  changeSetting(direction, directions, setDirection)
                }
              />
              <Text style={styles.text}>{directions[direction]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Flex Wrap"
                onPress={() => changeSetting(wrap, wraps, setWrap)}
              />
              <Text style={styles.text}>{wraps[wrap]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Add Square"
                onPress={() => setSquares([...squares, <Square />])}
              />
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Delete Square"
                onPress={() =>
                  setSquares(squares.filter((v, i) => i !== squares.length - 1))
                }
              />
            </View>
          </View>
        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const flexDirections = [
  'row',
  'row-reverse',
  'column',
  'column-reverse',
] as FlexStyle['flexDirection'][];
const justifyContents = [
  'flex-start',
  'flex-end',
  'center',
  'space-between',
  'space-around',
  'space-evenly',
] as FlexStyle['justifyContent'][];
const alignItemsArr = [
  'flex-start',
  'flex-end',
  'center',
  'stretch',
  'baseline',
] as FlexAlignType[];
const wraps = ['nowrap', 'wrap', 'wrap-reverse'];
const directions = ['inherit', 'ltr', 'rtl'];

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  layoutContainer: {
    flex: 0.5,
  },
  playingSpace: {
    backgroundColor: 'white',
    borderColor: 'blue',
    borderWidth: 3,
    overflow: 'hidden',
  },
  controlSpace: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  buttonView: {
    width: '50%',
    padding: 10,
  },
  text: {
    textAlign: 'center',
  },
});

const Square = () => (
  <View
    style={{
      width: 50,
      height: 50,
      backgroundColor: randomHexColor(),

```

---

TITLE: Dynamic Layout Properties Example - React Native (TypeScript)
DESCRIPTION: This React Native TypeScript example demonstrates how to dynamically adjust Flexbox layout properties such as `flexDirection`, `justifyContent`, `alignItems`, `direction`, and `flexWrap`. Users can interact with buttons to cycle through property values and add/remove colored squares, observing real-time UI changes. It utilizes `useState` for state management and `StyleSheet` for styling, with added type safety for property arrays.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/layout-props.md#_snippet_1

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {
  Button,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  View,
} from 'react-native';

const App = () => {
  const flexDirections = [
    'row',
    'row-reverse',
    'column',
    'column-reverse',
  ] as const;
  const justifyContents = [
    'flex-start',
    'flex-end',
    'center',
    'space-between',
    'space-around',
    'space-evenly',
  ] as const;
  const alignItemsArr = [
    'flex-start',
    'flex-end',
    'center',
    'stretch',
    'baseline',
  ] as const;
  const wraps = ['nowrap', 'wrap', 'wrap-reverse'] as const;
  const directions = ['inherit', 'ltr', 'rtl'] as const;
  const [flexDirection, setFlexDirection] = useState(0);
  const [justifyContent, setJustifyContent] = useState(0);
  const [alignItems, setAlignItems] = useState(0);
  const [direction, setDirection] = useState(0);
  const [wrap, setWrap] = useState(0);

  const hookedStyles = {
    flexDirection: flexDirections[flexDirection],
    justifyContent: justifyContents[justifyContent],
    alignItems: alignItemsArr[alignItems],
    direction: directions[direction],
    flexWrap: wraps[wrap],
  };

  const changeSetting = (
    value: number,
    options: readonly unknown[],
    setterFunction: (index: number) => void,
  ) => {
    if (value === options.length - 1) {
      setterFunction(0);
      return;
    }
    setterFunction(value + 1);
  };
  const [squares, setSquares] = useState([<Square />, <Square />, <Square />]);
  return (
    <>
      <View style={{paddingTop: StatusBar.currentHeight}} />
      <View style={[styles.container, styles.playingSpace, hookedStyles]}>
        {squares.map(elem => elem)}
      </View>
      <ScrollView style={styles.container}>
        <View style={styles.controlSpace}>
          <View style={styles.buttonView}>
            <Button
              title="Change Flex Direction"
              onPress={() =>
                changeSetting(flexDirection, flexDirections, setFlexDirection)
              }
            />
            <Text style={styles.text}>{flexDirections[flexDirection]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Justify Content"
              onPress={() =>
                changeSetting(
                  justifyContent,
                  justifyContents,
                  setJustifyContent,
                )
              }
            />
            <Text style={styles.text}>{justifyContents[justifyContent]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Align Items"
              onPress={() =>
                changeSetting(alignItems, alignItemsArr, setAlignItems)
              }
            />
            <Text style={styles.text}>{alignItemsArr[alignItems]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Direction"
              onPress={() => changeSetting(direction, directions, setDirection)}
            />
            <Text style={styles.text}>{directions[direction]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Flex Wrap"
              onPress={() => changeSetting(wrap, wraps, setWrap)}
            />
            <Text style={styles.text}>{wraps[wrap]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Add Square"
              onPress={() => setSquares([...squares, <Square />])}
            />
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Delete Square"
              onPress={() =>
                setSquares(squares.filter((v, i) => i !== squares.length - 1))
              }
            />
          </View>
        </View>
      </ScrollView>
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    height: '50%',
  },
  playingSpace: {
    backgroundColor: 'white',
    borderColor: 'blue',
    borderWidth: 3,
  },
  controlSpace: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    backgroundColor: '#F5F5F5',
  },
  buttonView: {
    width: '50%',
    padding: 10,
  },
  text: {textAlign: 'center'},
});

const Square = () => (
  <View
    style={{
      width: 50,
      height: 50,
      backgroundColor: randomHexColor(),
    }}
  />
);

const randomHexColor = () => {
  return '#000000'.replace(/0/g, () => {
    return Math.round(Math.random() * 16).toString(16);
  });
};

export default App;

```

---

TITLE: Importing useState Hook in React
DESCRIPTION: Shows how to import the `useState` Hook from the React library, which is the first step required to add state management capabilities to a functional component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/intro-react.md#_snippet_15

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
```

---

TITLE: Creating a Basic React Native Component
DESCRIPTION: This snippet demonstrates how to define a simple functional React Native component named `Cat`. It imports `React` and `Text` from `react-native`, then returns a `Text` element displaying a greeting. The component is exported for use in other parts of the application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/intro-react.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const Cat = () => {
  return <Text>Hello, I am your cat!</Text>;
};

export default Cat;
```

---

TITLE: Using Props with Functional Components in React Native (TypeScript)
DESCRIPTION: This snippet demonstrates the use of `props` with type definitions in React Native using TypeScript. It defines a `GreetingProps` type for the `name` prop, ensuring type safety. The `Greeting` functional component accepts and displays the `name` prop, and `LotsOfGreetings` reuses it with different names, showcasing type-safe prop usage.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/tutorial.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {Text, View, StyleSheet} from 'react-native';

const styles = StyleSheet.create({
  center: {
    alignItems: 'center',
  },
});

type GreetingProps = {
  name: string;
};

const Greeting = (props: GreetingProps) => {
  return (
    <View style={styles.center}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={[styles.center, {top: 50}]}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Controlling Main Axis Layout with Flex Direction in React Native
DESCRIPTION: This example illustrates the `flexDirection` property, which dictates the primary axis along which child components are laid out within their parent. It supports `column` (default), `row`, `column-reverse`, and `row-reverse` values, affecting the flow of elements and wrapping behavior. The `PreviewLayout` component is a helper for interactive demonstration.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/flexbox.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React, { useState } from "react";
import { StyleSheet, Text, TouchableOpacity, View } from "react-native";

const FlexDirectionBasics = () => {
  const [flexDirection, setflexDirection] = useState("column");

  return (
    <PreviewLayout
      label="flexDirection"
      values={["column", "row", "row-reverse", "column-reverse"]}
      selectedValue={flexDirection}
      setSelectedValue={setflexDirection}
    >
      <View
        style={[styles.box, { backgroundColor: "powderblue" }]}
      />
      <View
        style={[styles.box, { backgroundColor: "skyblue" }]}
      />
      <View
        style={[styles.box, { backgroundColor: "steelblue" }]}
      />
    </PreviewLayout>
  );
};

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}) => (
  <View style={{ padding: 10, flex: 1 }}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map((value) => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[
            styles.button,
            selectedValue === value && styles.selected,
          ]}
        >
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}
          >
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, { [label]: selectedValue }]}>
      {children}
    </View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: "aliceblue",
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: "row",
    flexWrap: "wrap",
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: "oldlace",
    alignSelf: "flex-start",
    marginHorizontal: "1%",
    marginBottom: 6,
    minWidth: "48%",
    textAlign: "center",
  },
  selected: {
    backgroundColor: "coral",
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: "500",
    color: "coral",
  },
  selectedLabel: {
    color: "white",
  },
  label: {
    textAlign: "center",
    marginBottom: 10,
    fontSize: 24,
  },
});

export default FlexDirectionBasics;
```

---

TITLE: Updating State with Button onPress in React Native
DESCRIPTION: This snippet demonstrates how to update a component's state by calling the state setter function (`setIsHungry`) within a `Button`'s `onPress` event handler. When the button is pressed, the `isHungry` state is set to `false`, triggering a re-render of the component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/intro-react.md#_snippet_17

LANGUAGE: typescript
CODE:

```
<Button
  onPress={() => {
    setIsHungry(false);
  }}
  //..
/>
```

---

TITLE: Basic VirtualizedList Usage - TypeScript
DESCRIPTION: This example demonstrates a basic implementation of VirtualizedList in React Native using TypeScript. It defines type interfaces (`ItemData`, `ItemProps`) for better type safety and functions for generating item data (`getItem`), determining item count (`getItemCount`), and rendering individual list items (`Item` component). The VirtualizedList is configured with `initialNumToRender`, `renderItem`, `keyExtractor`, `getItemCount`, and `getItem` props to efficiently display a list of 50 items.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/virtualizedlist.md#_snippet_1

LANGUAGE: typescript
CODE:

```
import React from 'react';
import {View, VirtualizedList, StyleSheet, Text, StatusBar} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

type ItemData = {
  id: string;
  title: string;
};

const getItem = (_data: unknown, index: number): ItemData => ({
  id: Math.random().toString(12).substring(0),
  title: `Item ${index + 1}`,
});

const getItemCount = (_data: unknown) => 50;

type ItemProps = {
  title: string;
};

const Item = ({title}: ItemProps) => (
  <View style={styles.item}>
    <Text style={styles.title}>{title}</Text>
  </View>
);

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container} edges={['top']}>
      <VirtualizedList
        initialNumToRender={4}
        renderItem={({item}) => <Item title={item.title} />}
        keyExtractor={item => item.id}
        getItemCount={getItemCount}
        getItem={getItem}
      />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: StatusBar.currentHeight,
  },
  item: {
    backgroundColor: '#f9c2ff',
    height: 150,
    justifyContent: 'center',
    marginVertical: 8,
    marginHorizontal: 16,
    padding: 20,
  },
  title: {
    fontSize: 32,
  },
});

export default App;
```

---

TITLE: Configuring TextInput for Enhanced User Experience in React Native (JavaScript)
DESCRIPTION: This snippet demonstrates how to optimize TextInput components in React Native for improved user experience in forms. It showcases features such as auto-focusing the first field, using placeholders, controlling autocapitalization and autocorrection, selecting appropriate keyboard types, and managing the return key to navigate between fields or submit the form. The example uses useState for state management and useRef to manage input focus.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/improvingux.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React, {useState, useRef} from 'react';
import {
  Alert,
  Text,
  StatusBar,
  TextInput,
  View,
  StyleSheet,
} from 'react-native';

const App = () => {
  const emailInput = useRef(null);
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');

  const submit = () => {
    Alert.alert(
      `Welcome, ${name}! Confirmation email has been sent to ${email}`,
    );
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      <View style={styles.header}>
        <Text style={styles.description}>
          This demo shows how using available TextInput customizations can make
          forms much easier to use. Try completing the form and notice that
          different fields have specific optimizations and the return key
          changes from focusing next input to submitting the form.
        </Text>
      </View>
      <TextInput
        style={styles.input}
        value={name}
        onChangeText={text => setName(text)}
        placeholder="Full Name"
        autoFocus={true}
        autoCapitalize="words"
        autoCorrect={true}
        keyboardType="default"
        returnKeyType="next"
        onSubmitEditing={() => emailInput.current.focus()}
        blurOnSubmit={false}
      />
      <TextInput
        style={styles.input}
        value={email}
        onChangeText={text => setEmail(text)}
        ref={emailInput}
        placeholder="email@example.com"
        autoCapitalize="none"
        autoCorrect={false}
        keyboardType="email-address"
        returnKeyType="send"
        onSubmitEditing={submit}
        blurOnSubmit={true}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    paddingTop: 64,
    padding: 20,
    backgroundColor: '#282c34',
  },
  description: {
    fontSize: 14,
    color: 'white',
  },
  input: {
    margin: 20,
    marginBottom: 0,
    height: 34,
    paddingHorizontal: 10,
    borderRadius: 4,
    borderColor: '#ccc',
    borderWidth: 1,
    fontSize: 16,
  },
});

export default App;
```

---

TITLE: Displaying Text in React Native using SnackPlayer
DESCRIPTION: This interactive example showcases a basic 'Hello World' application in React Native. It defines a functional component `YourApp` that renders a centered `Text` element within a `View`. This snippet requires `React` and core components from `react-native` and is designed to be run directly in a browser via SnackPlayer for live editing and preview.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/introduction.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const YourApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Try editing me! 🎉</Text>
    </View>
  );
};

export default YourApp;
```

---

TITLE: Complete Fetch Data Example in React Native (TypeScript)
DESCRIPTION: This comprehensive React Native component demonstrates fetching data from an API using Fetch, managing loading states with `useState`, and rendering the fetched data in a `FlatList`. It includes `useEffect` to trigger the data fetch on component mount and an `ActivityIndicator` for user feedback during loading, with added TypeScript type definitions for clarity and safety.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/network.md#_snippet_5

LANGUAGE: TypeScript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

type Movie = {
  id: string;
  title: string;
  releaseYear: string;
};

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState<Movie[]>([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Controlling Flex Direction in React Native (JavaScript)
DESCRIPTION: This example illustrates the `flexDirection` property, which defines the primary axis along which child components are laid out. It shows how to dynamically change the direction (column, row, column-reverse, row-reverse) using a state variable and interactive buttons. The `PreviewLayout` component provides a reusable UI for demonstrating different layout values.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/flexbox.md#_snippet_1

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {StyleSheet, Text, TouchableOpacity, View} from 'react-native';

const FlexDirectionBasics = () => {
  const [flexDirection, setflexDirection] = useState('column');

  return (
    <PreviewLayout
      label="flexDirection"
      values={['column', 'row', 'column-reverse', 'row-reverse']}
      selectedValue={flexDirection}
      setSelectedValue={setflexDirection}>
      <View style={[styles.box, {backgroundColor: 'powderblue'}]} />
      <View style={[styles.box, {backgroundColor: 'skyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'steelblue'}]} />
    </PreviewLayout>
  );
};

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default FlexDirectionBasics;
```

---

TITLE: Implementing a Basic FlatList in React Native
DESCRIPTION: This snippet demonstrates how to create a basic `FlatList` in React Native. It uses hardcoded data, rendering each item as a `Text` component. The `FlatList` efficiently displays long lists by only rendering elements currently visible on screen, requiring `data` and `renderItem` props.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/using-a-listview.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {FlatList, StyleSheet, Text, View} from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 22,
  },
  item: {
    padding: 10,
    fontSize: 18,
    height: 44,
  },
});

const FlatListBasics = () => {
  return (
    <View style={styles.container}>
      <FlatList
        data=[
          {key: 'Devin'},
          {key: 'Dan'},
          {key: 'Dominic'},
          {key: 'Jackson'},
          {key: 'James'},
          {key: 'Joel'},
          {key: 'John'},
          {key: 'Jillian'},
          {key: 'Jimmy'},
          {key: 'Julie'},
        ]
        renderItem={({item}) => <Text style={styles.item}>{item.key}</Text>}
      />
    </View>
  );
};

export default FlatListBasics;
```

---

TITLE: Managing State with useState Hook in React Native Functional Components
DESCRIPTION: This comprehensive example demonstrates how to use the `useState` Hook in React Native functional components to manage dynamic data. It shows a `Cat` component with an `isHungry` state variable that changes when a button is pressed, and a `Cafe` component that renders multiple `Cat` instances. It illustrates state declaration, conditional rendering based on state, and state updates via user interaction.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/intro-react.md#_snippet_16

LANGUAGE: JavaScript
CODE:

```
import React, { useState } from "react";
import { Button, Text, View } from "react-native";

const Cat = (props) => {
  const [isHungry, setIsHungry] = useState(true);

  return (
    <View>
      <Text>
        I am {props.name}, and I am {isHungry ? "hungry" : "full"}!
      </Text>
      <Button
        onPress={() => {
          setIsHungry(false);
        }}
        disabled={!isHungry}
        title={isHungry ? "Pour me some milk, please!" : "Thank you!"}
      />
    </View>
  );
}

const Cafe = () => {
  return (
    <>
      <Cat name="Munkustrap" />
      <Cat name="Spot" />
    </>
  );
}

export default Cafe;
```

---

TITLE: Embedding JavaScript Function Calls in JSX (JS)
DESCRIPTION: This snippet illustrates embedding a JavaScript function call within JSX using curly braces. The `getFullName` function concatenates names, and its return value is dynamically rendered inside the `Text` component, demonstrating advanced JSX capabilities.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/intro-react.md#_snippet_6

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const getFullName = (firstName, secondName, thirdName) => {
  return firstName + ' ' + secondName + ' ' + thirdName;
};

const Cat = () => {
  return <Text>Hello, I am {getFullName('Rum', 'Tum', 'Tugger')}!</Text>;
};

export default Cat;
```

---

TITLE: Registering a Root Component with AppRegistry (TSX)
DESCRIPTION: This snippet demonstrates how to register a React Native root component using `AppRegistry.registerComponent`. It imports necessary modules, defines a simple `App` component, and then registers it with a unique `appKey` ('Appname'). This is the standard way for a React Native application to expose its main component to the native environment for bootstrapping.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/appregistry.md#_snippet_0

LANGUAGE: tsx
CODE:

```
import {Text, AppRegistry} from 'react-native';

const App = () => (
  <View>
    <Text>App1</Text>
  </View>
);

AppRegistry.registerComponent('Appname', () => App);
```

---

TITLE: Embedding JavaScript Function Calls in JSX (JavaScript)
DESCRIPTION: This snippet demonstrates embedding a JavaScript function call within JSX using curly braces. The `getFullName` function concatenates three names, and its return value is rendered dynamically inside the `Text` component, showcasing advanced JSX expression usage.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/intro-react.md#_snippet_6

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const getFullName = (firstName, secondName, thirdName) => {
  return firstName + ' ' + secondName + ' ' + thirdName;
};

const Cat = () => {
  return <Text>Hello, I am {getFullName('Rum', 'Tum', 'Tugger')}!</Text>;
};

export default Cat;
```

---

TITLE: Importing useState Hook in React Native (TypeScript)
DESCRIPTION: This snippet shows the essential first step for using React's `useState` Hook: importing it from the 'react' library. This makes the `useState` function available for use within functional components to manage state.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/intro-react.md#_snippet_15

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
```

---

TITLE: Complete React Native App Fetching Data (JavaScript)
DESCRIPTION: This full React Native application demonstrates fetching data from an API using Fetch and displaying it in a FlatList. It manages loading states with `useState` and `useEffect`, showing an `ActivityIndicator` while data is being fetched.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/network.md#_snippet_4

LANGUAGE: JavaScript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Rendering Text with JSX in a Component
DESCRIPTION: This code demonstrates how a functional component returns a React element using JSX. The `Cat` component returns a `Text` element, which will render the specified string on the screen.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/intro-react.md#_snippet_3

LANGUAGE: TypeScript
CODE:

```
const Cat = () => {
  return <Text>Hello, I am your cat!</Text>;
};
```

---

TITLE: Incorrect Text Node Placement in React Native View
DESCRIPTION: This example highlights a critical difference in text handling between web and React Native. It shows an incorrect pattern where text is placed directly as a child of a `View` component, which will cause an exception. The correct approach, also shown, is to always wrap text nodes within a `<Text>` component when they are children of a `View`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/text.md#_snippet_4

LANGUAGE: TypeScript
CODE:

```
// BAD: will raise exception, can't have a text node as child of a <View>
<View>
  Some text
</View>

// GOOD
<View>
  <Text>
    Some text
  </Text>
</View>
```

---

TITLE: Creating and Using Custom Components with Props in React Native (TypeScript)
DESCRIPTION: This snippet demonstrates defining a custom `Greeting` component in TypeScript, including a type definition (`GreetingProps`) for its `name` prop. It shows how to pass different `name` values to multiple instances of `Greeting`, emphasizing type safety and reusability when working with props in TypeScript.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/props.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

type GreetingProps = {
  name: string;
};

const Greeting = (props: GreetingProps) => {
  return (
    <View style={{alignItems: 'center'}}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={{alignItems: 'center', top: 50}}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Managing State in Functional Components (TypeScript)
DESCRIPTION: This comprehensive example demonstrates state management in a React Native functional component using the `useState` Hook with TypeScript. It includes type definitions for props (`CatProps`), showing how to declare a state variable (`isHungry`), initialize it, and update it via a button press, causing the component to re-render and reflect the new state.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/intro-react.md#_snippet_19

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {Button, Text, View} from 'react-native';

type CatProps = {
  name: string;
};

const Cat = (props: CatProps) => {
  const [isHungry, setIsHungry] = useState(true);

  return (
    <View>
      <Text>
        I am {props.name}, and I am {isHungry ? 'hungry' : 'full'}!
      </Text>
      <Button
        onPress={() => {
          setIsHungry(false);
        }}
        disabled={!isHungry}
        title={isHungry ? 'Pour me some milk, please!' : 'Thank you!'}
      />
    </View>
  );
};

const Cafe = () => {
  return (
    <>
      <Cat name="Munkustrap" />
      <Cat name="Spot" />
    </>
  );
};

export default Cafe;
```

---

TITLE: Defining a Functional Component Structure
DESCRIPTION: This snippet illustrates the basic structure of a functional React component. It defines a constant `Cat` as an arrow function, which will serve as the blueprint for the component's rendering logic.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/intro-react.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
const Cat = () => {};
```

---

TITLE: Customizing Components with Props in React Native (TypeScript)
DESCRIPTION: This snippet demonstrates the use of `props` with type definitions in a React Native functional component using TypeScript. It defines an interface `GreetingProps` for type checking the `name` prop, ensuring type safety and improving code readability. The component reuses the `Greeting` component with different names.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/tutorial.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {Text, View, StyleSheet} from 'react-native';

const styles = StyleSheet.create({
  center: {
    alignItems: 'center',
  },
});

type GreetingProps = {
  name: string;
};

const Greeting = (props: GreetingProps) => {
  return (
    <View style={styles.center}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={[styles.center, {top: 50}]}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Arrow Functions Transformation - ECMAScript 2015 (ES6) - JavaScript
DESCRIPTION: Illustrates the use of arrow functions, a concise syntax for writing function expressions, commonly used in React Native for event handlers like `onPress`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/javascript-environment.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
<C onPress={() => this.setState({pressed: true})} />
```

---

TITLE: Rendering Basic Data with FlatList in React Native
DESCRIPTION: This snippet demonstrates how to use React Native's `FlatList` component to display a simple list of hardcoded data. It highlights the use of the `data` prop to provide the list items and the `renderItem` prop to define how each item is rendered as a `Text` component. The `StyleSheet` API is used to define basic styling for the container and list items.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/using-a-listview.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {FlatList, StyleSheet, Text, View} from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 22,
  },
  item: {
    padding: 10,
    fontSize: 18,
    height: 44,
  },
});

const FlatListBasics = () => {
  return (
    <View style={styles.container}>
      <FlatList
        data={[
          {key: 'Devin'},
          {key: 'Dan'},
          {key: 'Dominic'},
          {key: 'Jackson'},
          {key: 'James'},
          {key: 'Joel'},
          {key: 'John'},
          {key: 'Jillian'},
          {key: 'Jimmy'},
          {key: 'Julie'},
        ]}
        renderItem={({item}) => <Text style={styles.item}>{item.key}</Text>}
      />
    </View>
  );
};

export default FlatListBasics;
```

---

TITLE: Basic React Native Button Usage (TSX)
DESCRIPTION: This snippet demonstrates the fundamental usage of the React Native `Button` component, setting its `onPress` handler, `title`, `color`, and `accessibilityLabel` for improved user experience and accessibility.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/button.md#_snippet_0

LANGUAGE: tsx
CODE:

```
<Button
  onPress={onPressLearnMore}
  title="Learn More"
  color="#841584"
  accessibilityLabel="Learn more about this purple button"
/>
```

---

TITLE: Associating Labels with Inputs using aria-labelledby in React Native (TSX)
DESCRIPTION: This snippet demonstrates how to associate a `Text` component as a label for a `TextInput` using the `aria-labelledby` and `nativeID` properties in React Native. The `nativeID` of the label element is referenced by the `aria-labelledby` of the input, ensuring assistive technologies correctly identify the input's label.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/accessibility.md#_snippet_7

LANGUAGE: tsx
CODE:

```
<View>
  <Text nativeID="formLabel">Label for Input Field</Text>
  <TextInput aria-label="input" aria-labelledby="formLabel" />
</View>
```

---

TITLE: React Native Functional Component with TypeScript Props and State
DESCRIPTION: This TypeScript React Native component demonstrates how to define and use types for component props and state. It uses `React.FC<Props>` for functional component typing, defines an interface for `Props`, and manages internal state with `useState`, providing type safety and editor auto-completion.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/typescript.md#_snippet_4

LANGUAGE: tsx
CODE:

```
import React from 'react';
import {Button, StyleSheet, Text, View} from 'react-native';

export type Props = {
  name: string;
  baseEnthusiasmLevel?: number;
};

const Hello: React.FC<Props> = ({
  name,
  baseEnthusiasmLevel = 0,
}) => {
  const [enthusiasmLevel, setEnthusiasmLevel] = React.useState(
    baseEnthusiasmLevel,
  );

  const onIncrement = () =>
    setEnthusiasmLevel(enthusiasmLevel + 1);
  const onDecrement = () =>
    setEnthusiasmLevel(
      enthusiasmLevel > 0 ? enthusiasmLevel - 1 : 0,
    );

  const getExclamationMarks = (numChars: number) =>
    numChars > 0 ? Array(numChars + 1).join('!') : '';

  return (
    <View style={styles.container}>
      <Text style={styles.greeting}>
        Hello {name}
        {getExclamationMarks(enthusiasmLevel)}
      </Text>
      <View>
        <Button
          title="Increase enthusiasm"
          accessibilityLabel="increment"
          onPress={onIncrement}
          color="blue"
        />
        <Button
          title="Decrease enthusiasm"
          accessibilityLabel="decrement"
          onPress={onDecrement}
          color="red"
        />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  greeting: {
    fontSize: 20,
    fontWeight: 'bold',
    margin: 16,
  },
});

export default Hello;
```

---

TITLE: Installing Node.js and Watchman via Homebrew (Shell)
DESCRIPTION: This snippet demonstrates how to install Node.js and Watchman using Homebrew on macOS. Node.js is a JavaScript runtime essential for React Native, and Watchman is a file watcher that improves build performance by monitoring filesystem changes.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/_getting-started-macos-android.md#_snippet_0

LANGUAGE: shell
CODE:

```
brew install node
brew install watchman
```

---

TITLE: Using Flex for Dynamic Sizing in React Native
DESCRIPTION: This example illustrates the use of the `flex` property in React Native to allow components to dynamically expand and shrink based on available space. A `flex: 1` value tells a component to fill all available space, shared evenly among siblings. It's crucial for the parent component to have defined dimensions (either fixed or flex) for `flex` children to be visible.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/height-and-width.md#_snippet_1

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {View} from 'react-native';

const FlexDimensionsBasics = () => {
  return (
    // Try removing the `flex: 1` on the parent View.
    // The parent will not have dimensions, so the children can't expand.
    // What if you add `height: 300` instead of `flex: 1`?
    <View style={{flex: 1}}>
      <View style={{flex: 1, backgroundColor: 'powderblue'}} />
      <View style={{flex: 2, backgroundColor: 'skyblue'}} />
      <View style={{flex: 3, backgroundColor: 'steelblue'}} />
    </View>
  );
};

export default FlexDimensionsBasics;
```

---

TITLE: Managing Component State with useState in React Native (JavaScript)
DESCRIPTION: This snippet demonstrates how to use the `useState` Hook in a React Native functional component to manage a boolean state variable (`isHungry`). It shows how to initialize state, update it via a `Button`'s `onPress` event, and conditionally render UI based on the state's value. The `Cat` component's hunger state changes when its button is pressed, and the `Cafe` component renders multiple `Cat` instances.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/intro-react.md#_snippet_13

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {Button, Text, View} from 'react-native';

const Cat = props => {
  const [isHungry, setIsHungry] = useState(true);

  return (
    <View>
      <Text>
        I am {props.name}, and I am {isHungry ? 'hungry' : 'full'}!
      </Text>
      <Button
        onPress={() => {
          setIsHungry(false);
        }}
        disabled={!isHungry}
        title={isHungry ? 'Give me some food, please!' : 'Thank you!'}
      />
    </View>
  );
};

const Cafe = () => {
  return (
    <>
      <Cat name="Munkustrap" />
      <Cat name="Spot" />
    </>
  );
};

export default Cafe;
```

---

TITLE: Basic TextInput Usage in React Native
DESCRIPTION: This snippet demonstrates the fundamental use of `TextInput` in React Native. It shows how to capture user input using `onChangeText` for both general text and numeric input, and how to manage component state with `useState`. It also illustrates basic styling for the input fields.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/textinput.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {StyleSheet, TextInput} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const TextInputExample = () => {
  const [text, onChangeText] = React.useState('Useless Text');
  const [number, onChangeNumber] = React.useState('');

  return (
    <SafeAreaProvider>
      <SafeAreaView>
        <TextInput
          style={styles.input}
          onChangeText={onChangeText}
          value={text}
        />
        <TextInput
          style={styles.input}
          onChangeText={onChangeNumber}
          value={number}
          placeholder="useless placeholder"
          keyboardType="numeric"
        />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  input: {
    height: 40,
    margin: 12,
    borderWidth: 1,
    padding: 10,
  },
});

export default TextInputExample;
```

---

TITLE: Managing Component State with useState in React Native (JavaScript)
DESCRIPTION: Demonstrates a complete React Native application using the `useState` Hook to manage the `isHungry` state of `Cat` components. It includes a `Button` to update the state and a `Cafe` component to render multiple `Cat` instances, illustrating how state changes trigger re-renders.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/intro-react.md#_snippet_13

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {Button, Text, View} from 'react-native';

const Cat = props => {
  const [isHungry, setIsHungry] = useState(true);

  return (
    <View>
      <Text>
        I am {props.name}, and I am {isHungry ? 'hungry' : 'full'}!
      </Text>
      <Button
        onPress={() => {
          setIsHungry(false);
        }}
        disabled={!isHungry}
        title={isHungry ? 'Pour me some milk, please!' : 'Thank you!'}
      />
    </View>
  );
};

const Cafe = () => {
  return (
    <>
      <Cat name="Munkustrap" />
      <Cat name="Spot" />
    </>
  );
};

export default Cafe;
```

---

TITLE: Correctly Wrapping Text Nodes in React Native Views
DESCRIPTION: This example highlights a critical rule in React Native: text nodes must always be wrapped inside a `<Text>` component. It demonstrates an incorrect approach where text is a direct child of a `<View>` (which will cause an exception) and the correct way to wrap text within a `<Text>` component inside a `<View>`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/text.md#_snippet_4

LANGUAGE: tsx
CODE:

```
// BAD: will raise exception, can't have a text node as child of a <View>
<View>
  Some text
</View>

// GOOD
<View>
  <Text>
    Some text
  </Text>
</View>
```

---

TITLE: Defining a Basic React Native Component
DESCRIPTION: This snippet demonstrates how to define a simple functional React Native component named `Cat`. It imports `React` and `Text` from `react-native`, then returns a `Text` element displaying a greeting. The component is exported for use in other parts of the application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/intro-react.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const Cat = () => {
  return <Text>Hello, I am your cat!</Text>;
};

export default Cat;
```

---

TITLE: Controlling Row and Column Gap in React Native (JavaScript)
DESCRIPTION: This JavaScript snippet demonstrates how to dynamically adjust `rowGap` and `columnGap` properties in a React Native `View` component. It uses `useState` hooks to manage gap values and `TextInput` components for user input, allowing interactive exploration of spacing between wrapped flex items. The `PreviewLayout` component renders a set of colored boxes within a flex container, showcasing the effect of the gap properties.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/flexbox.md#_snippet_16

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {View, Text, StyleSheet, TextInput} from 'react-native';

const RowGapAndColumnGap = () => {
  const [rowGap, setRowGap] = useState(10);
  const [columnGap, setColumnGap] = useState(10);

  return (
    <PreviewLayout
      columnGap={columnGap}
      handleColumnGapChange={setColumnGap}
      rowGap={rowGap}
      handleRowGapChange={setRowGap}>
      <View style={[styles.box, styles.box1]} />
      <View style={[styles.box, styles.box2]} />
      <View style={[styles.box, styles.box3]} />
      <View style={[styles.box, styles.box4]} />
      <View style={[styles.box, styles.box5]} />
    </PreviewLayout>
  );
};

const PreviewLayout = ({
  children,
  handleColumnGapChange,
  handleRowGapChange,
  rowGap,
  columnGap,
}) => (
  <View style={styles.previewContainer}>
    <View style={styles.inputContainer}>
      <View style={styles.itemsCenter}>
        <Text>Row Gap</Text>
        <TextInput
          style={styles.input}
          value={rowGap}
          onChangeText={v => handleRowGapChange(Number(v))}
        />
      </View>
      <View style={styles.itemsCenter}>
        <Text>Column Gap</Text>
        <TextInput
          style={styles.input}
          value={columnGap}
          onChangeText={v => handleColumnGapChange(Number(v))}
        />
      </View>
    </View>
    <View style={[styles.container, {rowGap, columnGap}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  itemsCenter: {alignItems: 'center'},
  inputContainer: {
    gap: 4,
    flexDirection: 'row',
    justifyContent: 'space-around',
  },
  previewContainer: {padding: 10, flex: 1},
  input: {
    borderBottomWidth: 1,
    paddingVertical: 3,
    width: 50,
    textAlign: 'center',
  },
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
    maxHeight: 400,
    flexWrap: 'wrap',
    alignContent: 'flex-start',
  },
  box: {
    width: 50,
    height: 80,
  },
  box1: {
    backgroundColor: 'orangered',
  },
  box2: {
    backgroundColor: 'orange',
  },
  box3: {
    backgroundColor: 'mediumseagreen',
  },
  box4: {
    backgroundColor: 'deepskyblue',
  },
  box5: {
    backgroundColor: 'mediumturquoise',
  },
});

export default RowGapAndColumnGap;
```

---

TITLE: Demonstrating Core Components in React Native
DESCRIPTION: This snippet showcases the usage of several core React Native components including `View`, `Text`, `Image`, `ScrollView`, and `TextInput`. It demonstrates how to compose a simple UI with text, an image, and an interactive text input field, all wrapped within a scrollable container. The `Image` component displays an image from a URL, and `TextInput` allows user input with basic styling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/intro-react-native-components.md#_snippet_0

LANGUAGE: React Native
CODE:

```
import React from 'react';
import {View, Text, Image, ScrollView, TextInput} from 'react-native';

const App = () => {
  return (
    <ScrollView>
      <Text>Some text</Text>
      <View>
        <Text>Some more text</Text>
        <Image
          source={{
            uri: 'https://reactnative.dev/docs/assets/p_cat2.png',
          }}
          style={{width: 200, height: 200}}
        />
      </View>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="You can type in me"
      />
    </ScrollView>
  );
};

export default App;
```

---

TITLE: Creating a Basic Hello World App in React Native
DESCRIPTION: This snippet demonstrates how to create a simple 'Hello, world!' application in React Native. It imports `React` for JSX and `Text` and `View` components from `react-native`. The `HelloWorldApp` functional component renders a `View` container styled to center its content, which includes a `Text` component displaying 'Hello, world!'.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/tutorial.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const HelloWorldApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Hello, world!</Text>
    </View>
  );
};
export default HelloWorldApp;
```

---

TITLE: Creating Custom Components with Props (JavaScript)
DESCRIPTION: This JavaScript example illustrates how to define a reusable `Greeting` component that accepts a `name` prop. The `LotsOfGreetings` component then renders multiple instances of `Greeting`, passing different `name` values to each, demonstrating component customization and reusability through props.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/props.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const Greeting = props => {
  return (
    <View style={{alignItems: 'center'}}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={{alignItems: 'center', top: 50}}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Implementing a Counter with React Hooks (React Native)
DESCRIPTION: This snippet presents a counter application built with React Native, utilizing the `useState` hook for state management. It uses `View`, `Text`, and `Button` components from `react-native` and applies styles via `StyleSheet.create` to center the content on the screen. This demonstrates state handling parity between ReactJS and React Native.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/tutorial.md#_snippet_4

LANGUAGE: JavaScript
CODE:

```
import React, {useState} from 'react';
import {View, Text, Button, StyleSheet} from 'react-native';

const App = () => {
  const [count, setCount] = useState(0);

  return (
    <View style={styles.container}>
      <Text>You clicked {count} times</Text>
      <Button
        onPress={() => setCount(count + 1)}
        title="Click me!"
      />
    </View>
  );
};

// React Native Styles
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
```

---

TITLE: Creating Custom Components with Props (TypeScript)
DESCRIPTION: This TypeScript example demonstrates defining a reusable `Greeting` component, explicitly typing its `name` prop using the `GreetingProps` interface. The `LotsOfGreetings` component renders multiple instances, passing different `name` values, showcasing type-safe prop usage and component reusability in TypeScript.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/props.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

type GreetingProps = {
  name: string;
};

const Greeting = (props: GreetingProps) => {
  return (
    <View style={{alignItems: 'center'}}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={{alignItems: 'center', top: 50}}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Demonstrating Core Components in React Native
DESCRIPTION: This snippet showcases the usage of several core React Native components within a simple App component. It demonstrates how to render text using <Text>, group elements with <View>, display images with <Image>, create scrollable content with <ScrollView>, and allow user input with <TextInput>. It illustrates basic styling and component nesting.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/intro-react-native-components.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, Text, Image, ScrollView, TextInput} from 'react-native';

const App = () => {
  return (
    <ScrollView>
      <Text>Some text</Text>
      <View>
        <Text>Some more text</Text>
        <Image
          source={{
            uri: 'https://reactnative.dev/docs/assets/p_cat2.png',
          }}
          style={{width: 200, height: 200}}
        />
      </View>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="You can type in me"
      />
    </ScrollView>
  );
};

export default App;
```

---

TITLE: Demonstrating Core Components in React Native
DESCRIPTION: This React Native snippet illustrates the basic usage of several Core Components, including View, Text, Image, ScrollView, and TextInput. It shows how to import these components from 'react-native' and compose them within a functional component to create a simple, interactive user interface. The ScrollView ensures content is scrollable, and TextInput allows user input.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/intro-react-native-components.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, Text, Image, ScrollView, TextInput} from 'react-native';

const App = () => {
  return (
    <ScrollView>
      <Text>Some text</Text>
      <View>
        <Text>Some more text</Text>
        <Image
          source={{
            uri: 'https://reactnative.dev/docs/assets/p_cat2.png',
          }}
          style={{width: 200, height: 200}}
        />
      </View>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="You can type in me"
      />
    </ScrollView>
  );
};

export default App;
```

---

TITLE: Implementing Real-time Text Translation with React Native TextInput
DESCRIPTION: This snippet demonstrates how to create a simple 'Pizza Translator' application using React Native's `TextInput` component. It captures user input in real-time via the `onChangeText` prop, updates the component's state using the `useState` hook, and dynamically displays a translated output based on the input text.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/handling-text-input.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React, {useState} from 'react';
import {Text, TextInput, View} from 'react-native';

const PizzaTranslator = () => {
  const [text, setText] = useState('');
  return (
    <View style={{padding: 10}}>
      <TextInput
        style={{height: 40}}
        placeholder="Type here to translate!"
        onChangeText={newText => setText(newText)}
        defaultValue={text}
      />
      <Text style={{padding: 10, fontSize: 42}}>
        {text
          .split(' ')
          .map(word => word && '🍕')
          .join(' ')}
      </Text>
    </View>
  );
};

export default PizzaTranslator;
```

---

TITLE: Basic Pressable Component in React Native
DESCRIPTION: This snippet demonstrates the most basic usage of the `Pressable` component in React Native. It wraps a `Text` component, making it interactive. The `onPress` prop is used to define a function that will be executed when the component is pressed.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/pressable.md#_snippet_0

LANGUAGE: jsx
CODE:

```
<Pressable onPress={onPressFunction}>
  <Text>I'm pressable!</Text>
</Pressable>
```

---

TITLE: Creating a Hello World App in React Native
DESCRIPTION: This snippet demonstrates a basic 'Hello, world!' application in React Native. It imports `React`, `Text`, and `View` components, then defines a functional component `HelloWorldApp` that renders text within a styled `View` container. The styles `flex: 1`, `justifyContent: 'center'`, and `alignItems: 'center'` are used to center the content on the screen.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/tutorial.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const HelloWorldApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Hello, world!</Text>
    </View>
  );
};
export default HelloWorldApp;
```

---

TITLE: Passing Props to Custom Components (JS)
DESCRIPTION: This JavaScript example illustrates how to pass different `name` props to multiple instances of the `Cat` component. The `Cat` component receives `props` as an argument and uses `props.name` to display a customized greeting, demonstrating component customization through properties.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/intro-react.md#_snippet_10

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const Cat = props => {
  return (
    <View>
      <Text>Hello, I am {props.name}!</Text>
    </View>
  );
};

const Cafe = () => {
  return (
    <View>
      <Cat name="Maru" />
      <Cat name="Jellylorum" />
      <Cat name="Spot" />
    </View>
  );
};

export default Cafe;
```

---

TITLE: Configuring ANDROID_HOME Environment Variables for React Native Android
DESCRIPTION: This snippet sets up essential environment variables required by React Native tools to build applications with native Android code. It defines ANDROID_HOME to point to the Android SDK location and adds the emulator and platform-tools directories to the system's PATH, enabling command-line access to Android development tools. These variables are typically added to shell configuration files like .bash_profile or .zprofile.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/_getting-started-linux-android.md#_snippet_0

LANGUAGE: Shell
CODE:

```
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

---

TITLE: Configuring Android Environment Variables (Shell)
DESCRIPTION: These commands set the `ANDROID_HOME` environment variable to the Android SDK path and append the `emulator` and `platform-tools` directories to the system's `PATH`. This is crucial for React Native tools to locate necessary Android SDK components for building applications.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/_getting-started-macos-android.md#_snippet_3

LANGUAGE: shell
CODE:

```
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

---

TITLE: Creating Custom Components with Props in React Native (JavaScript)
DESCRIPTION: This example illustrates how to define a custom functional component, `Greeting`, that accepts `props` to customize its output. The `LotsOfGreetings` component then reuses `Greeting` multiple times, passing different `name` props to each instance, showcasing component reusability.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/props.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const Greeting = props => {
  return (
    <View style={{alignItems: 'center'}}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={{alignItems: 'center', top: 50}}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Using Props in React Native Functional Components (JavaScript)
DESCRIPTION: This example illustrates how to use 'props' to pass data between components in React Native using JavaScript. It defines a `Greeting` functional component that accepts a `name` prop to display personalized greetings and a `LotsOfGreetings` component that reuses `Greeting` with different names. It also shows basic styling with `StyleSheet.create`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/tutorial.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View, StyleSheet} from 'react-native';

const styles = StyleSheet.create({
  center: {
    alignItems: 'center',
  },
});

const Greeting = props => {
  return (
    <View style={styles.center}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={[styles.center, {top: 50}]}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Starting Metro Bundler with Yarn (Shell)
DESCRIPTION: This command initiates the Metro development server using Yarn, bundling JavaScript code and serving it to the React Native application. It should be run in the root directory of the React Native project.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/_integration-with-existing-apps-java.md#_snippet_12

LANGUAGE: shell
CODE:

```
yarn start
```

---

TITLE: Applying Flex Property in React Native
DESCRIPTION: This snippet demonstrates how the `flex` property distributes available space among child components within a container. The space is divided proportionally based on each child's `flex` value, allowing for dynamic sizing along the main axis.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/flexbox.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {StyleSheet, View} from 'react-native';

const Flex = () => {
  return (
    <View
      style={[
        styles.container,
        {
          // Try setting `flexDirection` to "row".
          flexDirection: 'column',
        },
      ]}>
      <View style={{flex: 1, backgroundColor: 'red'}} />
      <View style={{flex: 2, backgroundColor: 'darkorange'}} />
      <View style={{flex: 3, backgroundColor: 'green'}} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
});

export default Flex;
```

---

TITLE: Creating a Native Stack Navigator (React Native)
DESCRIPTION: Illustrates the creation of a native stack navigator using `createNativeStackNavigator` to define a navigation flow with multiple screens. It sets up 'Home' and 'Profile' screens with custom options.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/navigation.md#_snippet_5

LANGUAGE: typescript
CODE:

```
import * as React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';

const Stack = createNativeStackNavigator();

const MyStack = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen
          name="Home"
          component={HomeScreen}
          options={{title: 'Welcome'}}
        />
        <Stack.Screen name="Profile" component={ProfileScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};
```

---

TITLE: Applying alignContent in React Native (JavaScript)
DESCRIPTION: This React Native component demonstrates the `alignContent` flexbox property. It uses `useState` to dynamically change the `alignContent` value, allowing users to interactively see how different values (`flex-start`, `flex-end`, `stretch`, `center`, `space-between`, `space-around`) affect the distribution of wrapped items along the cross-axis. It requires `react`, `react-native` components like `View`, `TouchableOpacity`, `Text`, and `StyleSheet` for its functionality.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/flexbox.md#_snippet_11

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';

const AlignContentLayout = () => {
  const [alignContent, setAlignContent] = useState('flex-start');

  return (
    <PreviewLayout
      label="alignContent"
      selectedValue={alignContent}
      values={[
        'flex-start',
        'flex-end',
        'stretch',
        'center',
        'space-between',
        'space-around',
      ]}
      setSelectedValue={setAlignContent}>
      <View style={[styles.box, {backgroundColor: 'orangered'}]} />
      <View style={[styles.box, {backgroundColor: 'orange'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumseagreen'}]} />
      <View style={[styles.box, {backgroundColor: 'deepskyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumturquoise'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumslateblue'}]} />
      <View style={[styles.box, {backgroundColor: 'purple'}]} />
    </PreviewLayout>
  );
};

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexWrap: 'wrap',
    marginTop: 8,
    backgroundColor: 'aliceblue',
    maxHeight: 400,
  },
  box: {
    width: 50,
    height: 80,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default AlignContentLayout;
```

---

TITLE: Creating a Native Stack Navigator (React Native TSX)
DESCRIPTION: This code sets up a native stack navigator using `createNativeStackNavigator` from React Navigation. It defines two screens, 'Home' and 'Profile', within a `Stack.Navigator`, demonstrating how to register components for navigation and set screen-specific options like titles.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/navigation.md#_snippet_5

LANGUAGE: tsx
CODE:

```
import * as React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';

const Stack = createNativeStackNavigator();

const MyStack = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen
          name="Home"
          component={HomeScreen}
          options={{title: 'Welcome'}}
        />
        <Stack.Screen name="Profile" component={ProfileScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};
```

---

TITLE: Creating a Basic "Hello World" App in React Native
DESCRIPTION: This snippet demonstrates the simplest React Native application, displaying "Hello, world!". It introduces `View` for layout and `Text` for displaying text, along with basic styling for centering content on the screen.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/tutorial.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const HelloWorldApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Hello, world!</Text>
    </View>
  );
};
export default HelloWorldApp;
```

---

TITLE: Creating Reusable Components with Props (TypeScript)
DESCRIPTION: This TypeScript snippet demonstrates how to create a custom `Greeting` component that accepts a `name` prop, including type definition for the props. It shows how to pass different `name` values to multiple instances of the `Greeting` component within a `LotsOfGreetings` component, highlighting type-safe prop usage in TypeScript.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/props.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

type GreetingProps = {
  name: string;
};

const Greeting = (props: GreetingProps) => {
  return (
    <View style={{alignItems: 'center'}}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={{alignItems: 'center', top: 50}}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Applying Justify Content in React Native (JavaScript)
DESCRIPTION: This React Native component demonstrates the usage of the `justifyContent` style property to align child elements within a container. It uses `useState` to dynamically change the `justifyContent` value based on user interaction, showcasing how different alignment options affect the layout of three colored boxes. The `PreviewLayout` component provides a UI for selecting alignment values.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/flexbox.md#_snippet_5

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';

const JustifyContentBasics = () => {
  const [justifyContent, setJustifyContent] = useState('flex-start');

  return (
    <PreviewLayout
      label="justifyContent"
      selectedValue={justifyContent}
      values={[
        'flex-start',
        'flex-end',
        'center',
        'space-between',
        'space-around',
        'space-evenly',
      ]}
      setSelectedValue={setJustifyContent}>
      <View style={[styles.box, {backgroundColor: 'powderblue'}]} />
      <View style={[styles.box, {backgroundColor: 'skyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'steelblue'}]} />
    </PreviewLayout>
  );
};

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default JustifyContentBasics;
```

---

TITLE: Nesting Core Components in React Native
DESCRIPTION: This example shows how to nest React Native Core Components like `Text` and `TextInput` inside a `View` component. The `TextInput` is styled with inline styles for height, border color, and width, demonstrating basic layout and input element usage within a custom component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/intro-react.md#_snippet_8

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, TextInput, View} from 'react-native';

const Cat = () => {
  return (
    <View>
      <Text>Hello, I am...</Text>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="Name me!"
      />
    </View>
  );
};

export default Cat;
```

---

TITLE: Managing State in Functional Components (JavaScript)
DESCRIPTION: This comprehensive example demonstrates state management in a React Native functional component using the `useState` Hook. It shows how to declare a state variable (`isHungry`), initialize it, and update it via a button press, causing the component to re-render and reflect the new state.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/intro-react.md#_snippet_18

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {Button, Text, View} from 'react-native';

const Cat = props => {
  const [isHungry, setIsHungry] = useState(true);

  return (
    <View>
      <Text>
        I am {props.name}, and I am {isHungry ? 'hungry' : 'full'}!
      </Text>
      <Button
        onPress={() => {
          setIsHungry(false);
        }}
        disabled={!isHungry}
        title={isHungry ? 'Pour me some milk, please!' : 'Thank you!'}
      />
    </View>
  );
};

const Cafe = () => {
  return (
    <>
      <Cat name="Munkustrap" />
      <Cat name="Spot" />
    </>
  );
};

export default Cafe;
```

---

TITLE: Platform select() Method Signature in React Native
DESCRIPTION: This snippet defines the type signature for the `Platform.select()` method. This utility method allows developers to provide platform-specific values based on the current operating system, returning the most fitting value from the provided configuration object.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/platform.md#_snippet_8

LANGUAGE: typescript
CODE:

```
static select(config: Record<string, T>): T;
```

---

TITLE: Implementing Pull-to-Refresh with RefreshControl in React Native
DESCRIPTION: This example demonstrates how to integrate `RefreshControl` into a `ScrollView` to provide pull-to-refresh functionality. It uses `useState` to manage the `refreshing` state and `useCallback` for the `onRefresh` handler, which simulates a network request with a timeout. The `refreshing` prop must be set to `true` when refreshing starts and `false` when it completes.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/refreshcontrol.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {
  RefreshControl,
  SafeAreaView,
  ScrollView,
  StyleSheet,
  Text,
} from 'react-native';

const App = () => {
  const [refreshing, setRefreshing] = React.useState(false);

  const onRefresh = React.useCallback(() => {
    setRefreshing(true);
    setTimeout(() => {
      setRefreshing(false);
    }, 2000);
  }, []);

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView
        contentContainerStyle={styles.scrollView}
        refreshControl={
          <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
        }>
        <Text>Pull down to see RefreshControl indicator</Text>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  scrollView: {
    flex: 1,
    backgroundColor: 'pink',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;
```

---

TITLE: Registering React Native Component in index.js
DESCRIPTION: Defines the entry point for the React Native application in `index.js`, registering the root component (`App`) with `AppRegistry` under the name 'HelloWorld'. This file is always required and serves as the starting point for the React Native runtime to load and display components.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/_integration-with-existing-apps-kotlin.md#_snippet_9

LANGUAGE: javascript
CODE:

```
import {AppRegistry} from 'react-native';
import App from './App';

AppRegistry.registerComponent('HelloWorld', () => App);
```

---

TITLE: Registering Root Component - React Native AppRegistry - TSX
DESCRIPTION: This snippet demonstrates how to register a root React Native component using `AppRegistry.registerComponent`. It imports `Text` and `AppRegistry` from `react-native`, defines a simple `App` component, and then registers it with a unique `appKey` ('Appname'). This is the primary way to make a React Native component available to the native host application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/appregistry.md#_snippet_0

LANGUAGE: TSX
CODE:

```
import {Text, AppRegistry} from 'react-native';

const App = () => (
  <View>
    <Text>App1</Text>
  </View>
);

AppRegistry.registerComponent('Appname', () => App);
```

---

TITLE: Initializing a New React Native App with TypeScript (0.71)
DESCRIPTION: This command initializes a new React Native project named 'My71App' using version 0.71.0 of the React Native CLI. Starting with 0.71, newly created apps are TypeScript by default, setting up `App.tsx` and `tsconfig.json` automatically.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/blog/2023-01-03-typescript-first.md#_snippet_0

LANGUAGE: Shell
CODE:

```
npx react-native init My71App --version 0.71.0
```

---

TITLE: Complete React Native App Fetching Data (TypeScript)
DESCRIPTION: This full React Native application, written in TypeScript, demonstrates fetching data from an API using Fetch and displaying it in a FlatList. It includes type definitions for movie data and manages loading states with `useState` and `useEffect`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/network.md#_snippet_5

LANGUAGE: TypeScript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

type Movie = {
  id: string;
  title: string;
  releaseYear: string;
};

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState<Movie[]>([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Implementing SafeAreaView for iOS Safe Areas
DESCRIPTION: This React Native example demonstrates the basic usage of `SafeAreaView` to ensure content is displayed correctly within the safe area of iOS devices. It wraps the main application content, applying `flex: 1` to the container style to occupy available space, and defines basic text styling. This setup prevents content from being obscured by device notches, rounded corners, or system UI elements.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/safeareaview.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {StyleSheet, Text, SafeAreaView} from 'react-native';

const App = () => {
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.text}>Page content</Text>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  text: {
    fontSize: 25,
    fontWeight: '500',
  },
});

export default App;
```

---

TITLE: Applying Flex Property in React Native (JavaScript)
DESCRIPTION: This snippet demonstrates how the `flex` property distributes available space among child components within a Flexbox container. Children with higher `flex` values receive proportionally more space along the main axis. In this example, views are colored red, orange, and green, receiving 1/6, 2/6, and 3/6 of the space respectively.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/flexbox.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {StyleSheet, View} from 'react-native';

const Flex = () => {
  return (
    <View
      style={[
        styles.container,
        {
          // Try setting `flexDirection` to "row".
          flexDirection: 'column',
        },
      ]}>
      <View style={{flex: 1, backgroundColor: 'red'}} />
      <View style={{flex: 2, backgroundColor: 'darkorange'}} />
      <View style={{flex: 3, backgroundColor: 'green'}} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
});

export default Flex;
```

---

TITLE: Creating Styles with StyleSheet.create in React Native
DESCRIPTION: This snippet demonstrates the fundamental usage of `StyleSheet.create()` to define and encapsulate styles in a React Native application. By centralizing styles, it enhances code readability, promotes reusability, and enables static type checking in IDEs, aligning with best practices for styling components.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/stylesheet.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Text style={styles.title}>React Native</Text>
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 24,
    backgroundColor: '#eaeaea',
  },
  title: {
    marginTop: 16,
    paddingVertical: 8,
    borderWidth: 4,
    borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: '#61dafb',
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
  },
});

export default App;
```

---

TITLE: Component Returning a React Element with JSX
DESCRIPTION: This snippet demonstrates how a functional React component returns a React element using JSX. The `Cat` component will render a `Text` element, which describes what should be rendered on the screen, in this case, a simple greeting.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/intro-react.md#_snippet_3

LANGUAGE: TypeScript
CODE:

```
const Cat = () => {
  return <Text>Hello, I am your cat!</Text>;
};
```

---

TITLE: Basic 'Hello World' React Native App
DESCRIPTION: This interactive example showcases a fundamental React Native application. It utilizes `View` for layout and `Text` to display a simple message, demonstrating how to render UI components. The snippet is designed to be editable within a SnackPlayer, allowing users to experiment with the code directly in the browser.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/introduction.md#_snippet_0

LANGUAGE: React Native
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const YourApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Try editing me! 🎉</Text>
    </View>
  );
};

export default YourApp;
```

---

TITLE: Conditional Rendering and Prop Assignment based on State
DESCRIPTION: This example shows how to conditionally set the `disabled` prop and `title` of a `Button` component based on the current value of the `isHungry` state variable. This allows the UI to dynamically respond to state changes, disabling the button and changing its text when the cat is no longer hungry.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/intro-react.md#_snippet_23

LANGUAGE: javascript
CODE:

```
<Button
  //..
  disabled={!isHungry}
  title={isHungry ? 'Pour me some milk, please!' : 'Thank you!'}
/>
```

---

TITLE: Defining a Basic React Native Component
DESCRIPTION: This snippet defines a simple functional React Native component named `Cat`. It imports `React` and `Text` from `react-native`, and the component returns a `Text` element displaying a greeting. The component is then exported as the default.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/intro-react.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const Cat = () => {
  return <Text>Hello, I am your cat!</Text>;
};

export default Cat;
```

---

TITLE: Creating New React Native Project (0.79)
DESCRIPTION: Provides the command-line instruction to initialize a new React Native project using the `@react-native-community/cli` tool, ensuring the latest stable version (0.79) of React Native is set up.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/blog/2025-04-08-react-native-0.79.md#_snippet_6

LANGUAGE: Shell
CODE:

```
npx @react-native-community/cli@latest init MyProject --version latest
```

---

TITLE: Creating Reusable Components with Props (JavaScript)
DESCRIPTION: This JavaScript snippet illustrates how to create a custom `Greeting` component that accepts a `name` prop. It shows how to pass different `name` values to multiple instances of the `Greeting` component within a `LotsOfGreetings` component, demonstrating component reusability and prop usage.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/props.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const Greeting = props => {
  return (
    <View style={{alignItems: 'center'}}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={{alignItems: 'center', top: 50}}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Implementing State with useState in React Native (JavaScript)
DESCRIPTION: This example demonstrates how to use the `useState` Hook in a React Native functional component to manage a boolean state variable (`isHungry`). It shows how to initialize state, display its value in a `Text` component, and update it via a `Button`'s `onPress` event, causing the component to re-render and reflect the new state.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/intro-react.md#_snippet_13

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {Button, Text, View} from 'react-native';

const Cat = props => {
  const [isHungry, setIsHungry] = useState(true);

  return (
    <View>
      <Text>
        I am {props.name}, and I am {isHungry ? 'hungry' : 'full'}!
      </Text>
      <Button
        onPress={() => {
          setIsHungry(false);
        }}
        disabled={!isHungry}
        title={isHungry ? 'Give me some food, please!' : 'Thank you!'}
      />
    </View>
  );
};

const Cafe = () => {
  return (
    <>
      <Cat name="Munkustrap" />
      <Cat name="Spot" />
    </>
  );
};

export default Cafe;
```

---

TITLE: Creating Styles with StyleSheet.create in React Native
DESCRIPTION: This snippet demonstrates the fundamental usage of `StyleSheet.create` to define a collection of styles. By centralizing styles, it enhances code readability and maintainability, separating styling logic from component rendering. This approach also allows React Native to optimize style application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/stylesheet.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {StyleSheet, Text, View} from 'react-native';

const App = () => (
  <View style={styles.container}>
    <Text style={styles.title}>React Native</Text>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 24,
    backgroundColor: '#eaeaea',
  },
  title: {
    marginTop: 16,
    paddingVertical: 8,
    borderWidth: 4,
    borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: '#61dafb',
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
  },
});

export default App;
```

---

TITLE: Using Custom Components for Consistent Text Styling in React Native
DESCRIPTION: This example illustrates a recommended pattern for managing consistent font styles and sizes across a React Native application. By creating a reusable `MyAppText` component, developers can centralize default text styling. `MyAppHeaderText` further demonstrates how to compose these base components for more specific text types, ensuring style consistency and reusability.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/text.md#_snippet_4

LANGUAGE: TypeScript
CODE:

```
<View>
  <MyAppText>
    Text styled with the default font for the entire application
  </MyAppText>
  <MyAppHeaderText>Text styled as a header</MyAppHeaderText>
</View>
```

---

TITLE: Creating a Basic Hello World App in React Native
DESCRIPTION: This snippet demonstrates a minimal 'Hello, world!' application in React Native. It imports `React`, `Text`, and `View` components, defines a functional component `HelloWorldApp`, and applies basic flexbox styles to center the text on the screen. It serves as a foundational example for React Native app structure.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/tutorial.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const HelloWorldApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Hello, world!</Text>
    </View>
  );
};
export default HelloWorldApp;
```

---

TITLE: Functional React Native Component Returning Text Element
DESCRIPTION: This snippet shows a functional React Native component returning a `Text` element. The `return` statement defines what the component will render on the screen, in this case, a simple text greeting.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/intro-react.md#_snippet_3

LANGUAGE: TypeScript
CODE:

```
const Cat = () => {
  return <Text>Hello, I am your cat!</Text>;
};
```

---

TITLE: Interactive Layout Properties Example in React Native
DESCRIPTION: This React Native application demonstrates the dynamic adjustment of Flexbox layout properties such as `flexDirection`, `justifyContent`, `alignItems`, `direction`, and `flexWrap`. It uses React Hooks (`useState`) to manage state for layout properties and the number of squares displayed. Users can interact with buttons to change property values and add/remove squares, observing real-time UI updates. Dependencies include `react`, `react-native`, and `react-native-safe-area-context`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/layout-props.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {Button, ScrollView, StyleSheet, Text, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [flexDirection, setFlexDirection] = useState(0);
  const [justifyContent, setJustifyContent] = useState(0);
  const [alignItems, setAlignItems] = useState(0);
  const [direction, setDirection] = useState(0);
  const [wrap, setWrap] = useState(0);

  const [squares, setSquares] = useState([<Square />, <Square />, <Square />]);

  const hookedStyles = {
    flexDirection: flexDirections[flexDirection],
    justifyContent: justifyContents[justifyContent],
    alignItems: alignItemsArr[alignItems],
    direction: directions[direction],
    flexWrap: wraps[wrap],
  };

  const changeSetting = (value, options, setterFunction) => {
    if (value === options.length - 1) {
      setterFunction(0);
      return;
    }
    setterFunction(value + 1);
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={[styles.container, styles.playingSpace, hookedStyles]}>
          {squares.map(elem => elem)}
        </View>
        <ScrollView style={styles.layoutContainer}>
          <View style={styles.controlSpace}>
            <View style={styles.buttonView}>
              <Button
                title="Change Flex Direction"
                onPress={() =>
                  changeSetting(flexDirection, flexDirections, setFlexDirection)
                }
              />
              <Text style={styles.text}>{flexDirections[flexDirection]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Justify Content"
                onPress={() =>
                  changeSetting(
                    justifyContent,
                    justifyContents,
                    setJustifyContent,
                  )
                }
              />
              <Text style={styles.text}>{justifyContents[justifyContent]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Align Items"
                onPress={() =>
                  changeSetting(alignItems, alignItemsArr, setAlignItems)
                }
              />
              <Text style={styles.text}>{alignItemsArr[alignItems]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Direction"
                onPress={() =>
                  changeSetting(direction, directions, setDirection)
                }
              />
              <Text style={styles.text}>{directions[direction]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Flex Wrap"
                onPress={() => changeSetting(wrap, wraps, setWrap)}
              />
              <Text style={styles.text}>{wraps[wrap]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Add Square"
                onPress={() => setSquares([...squares, <Square />])}
              />
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Delete Square"
                onPress={() =>
                  setSquares(squares.filter((v, i) => i !== squares.length - 1))
                }
              />
            </View>
          </View>
        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const flexDirections = ['row', 'row-reverse', 'column', 'column-reverse'];
const justifyContents = [
  'flex-start',
  'flex-end',
  'center',
  'space-between',
  'space-around',
  'space-evenly',
];
const alignItemsArr = [
  'flex-start',
  'flex-end',
  'center',
  'stretch',
  'baseline',
];
const wraps = ['nowrap', 'wrap', 'wrap-reverse'];
const directions = ['inherit', 'ltr', 'rtl'];

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  layoutContainer: {
    flex: 0.5,
  },
  playingSpace: {
    backgroundColor: 'white',
    borderColor: 'blue',
    borderWidth: 3,
    overflow: 'hidden',
  },
  controlSpace: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  buttonView: {
    width: '50%',
    padding: 10,
  },
  text: {
    textAlign: 'center',
  },
});

const Square = () => (
  <View
    style={{
      width: 50,
      height: 50,
      backgroundColor: randomHexColor(),
    }}
  />
);
```

---

TITLE: Testing User Interaction with React Native Testing Library
DESCRIPTION: This test snippet demonstrates how to simulate user interactions on the `GroceryShoppingList` component using `React Native Testing Library`. It uses `fireEvent.changeText` to simulate text input and `fireEvent.press` to simulate a button tap, then asserts the presence of the added item using `getAllByText`, focusing on user-centric testing without relying on internal component state.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/testing-overview.md#_snippet_2

LANGUAGE: tsx
CODE:

```
test('given empty GroceryShoppingList, user can add an item to it', () => {
  const {getByPlaceholderText, getByText, getAllByText} = render(
    <GroceryShoppingList />,
  );

  fireEvent.changeText(
    getByPlaceholderText('Enter grocery item'),
    'banana',
  );
  fireEvent.press(getByText('Add the item to list'));

  const bananaElements = getAllByText('banana');
  expect(bananaElements).toHaveLength(1); // expect 'banana' to be on the list
});
```

---

TITLE: Applying Platform-Specific Styles with Platform.select in React Native
DESCRIPTION: This example uses `Platform.select` to apply different background colors based on the platform. It sets 'red' for iOS, 'green' for Android, and 'blue' for other platforms (like web). `Platform.select` provides a more concise way to handle multiple platform-specific values.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/platform-specific-code.md#_snippet_1

LANGUAGE: tsx
CODE:

```
import {Platform, StyleSheet} from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    ...Platform.select({
      ios: {
        backgroundColor: 'red',
      },
      android: {
        backgroundColor: 'green',
      },
      default: {
        // other platforms, web for example
        backgroundColor: 'blue',
      },
    }),
  },
});
```

---

TITLE: Creating a Basic React Native 'Hello World' App
DESCRIPTION: This snippet demonstrates a fundamental React Native application using `Text` and `View` components to display a simple message. It's designed to be run interactively within a SnackPlayer, allowing users to directly edit and observe changes in the browser without a local setup.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/introduction.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const YourApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Try editing me! 🎉</Text>
    </View>
  );
};

export default YourApp;
```

---

TITLE: Complete Fetch Data Display Example in React Native (JavaScript)
DESCRIPTION: This comprehensive React Native component demonstrates fetching data from an API, managing loading states with useState, and displaying the fetched data in a FlatList. It uses useEffect to initiate the data fetch on component mount and handles potential errors.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/network.md#_snippet_4

LANGUAGE: JavaScript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Generating Upload Key for Android (macOS)
DESCRIPTION: This command generates a private signing key and a keystore file (`my-upload-key.keystore`) using `keytool` on macOS, requiring `sudo` permissions. It prompts for passwords and creates a key valid for 10000 days, which is essential for signing the application binary before uploading to Google Play.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/signed-apk-android.md#_snippet_2

LANGUAGE: shell
CODE:

```
sudo keytool -genkey -v -keystore my-upload-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

---

TITLE: Handling Fetch Response with Async/Await in React Native
DESCRIPTION: This asynchronous function illustrates how to handle a Fetch response using the 'async' / 'await' syntax. It simplifies asynchronous code by waiting for the response and JSON parsing, including error handling with a 'try...catch' block.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/network.md#_snippet_3

LANGUAGE: tsx
CODE:

```
const getMoviesFromApiAsync = async () => {
  try {
    const response = await fetch(
      'https://reactnative.dev/movies.json',
    );
    const json = await response.json();
    return json.movies;
  } catch (error) {
    console.error(error);
  }
};
```

---

TITLE: Applying Flex Property in React Native (JavaScript)
DESCRIPTION: This snippet demonstrates how the `flex` property distributes available space among child components within a Flexbox container. Children with higher `flex` values occupy proportionally more space along the main axis. The container itself has `flex: 1` to fill the available screen space.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/flexbox.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {StyleSheet, View} from 'react-native';

const Flex = () => {
  return (
    <View
      style={[
        styles.container,
        {
          // Try setting `flexDirection` to `"row"`.
          flexDirection: 'column',
        },
      ]}>
      <View style={{flex: 1, backgroundColor: 'red'}} />
      <View style={{flex: 2, backgroundColor: 'darkorange'}} />
      <View style={{flex: 3, backgroundColor: 'green'}} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
});

export default Flex;
```

---

TITLE: Creating a Native Stack Navigator (TypeScript/React)
DESCRIPTION: Illustrates how to create a native stack navigator using `createNativeStackNavigator` and define multiple screens (`Home`, `Profile`) within a `Stack.Navigator`. Each `Stack.Screen` component links a name to a React component and can include screen-specific options like a title.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/navigation.md#_snippet_5

LANGUAGE: typescript
CODE:

```
import * as React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';

const Stack = createNativeStackNavigator();

const MyStack = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen
          name="Home"
          component={HomeScreen}
          options={{title: 'Welcome'}}
        />
        <Stack.Screen name="Profile" component={ProfileScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};
```

---

TITLE: Passing Props to Custom Components in React Native (JavaScript)
DESCRIPTION: This example illustrates how to define a custom `Greeting` component that accepts a `name` prop. The `LotsOfGreetings` component then reuses `Greeting` multiple times, passing different `name` values to customize each instance, showcasing component reusability with props.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/props.md#_snippet_1

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const Greeting = props => {
  return (
    <View style={{alignItems: 'center'}}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={{alignItems: 'center', top: 50}}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Starting React Native App on iOS Simulator (npm/yarn)
DESCRIPTION: This snippet demonstrates how to launch a React Native application on the default iOS simulator using either npm or yarn. It assumes the project has been initialized and dependencies are installed.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/running-on-simulator-ios.md#_snippet_0

LANGUAGE: shell
CODE:

```
npm run ios
```

LANGUAGE: shell
CODE:

```
yarn ios
```

---

TITLE: Running React Native Android App (Yarn)
DESCRIPTION: This command builds and runs the React Native application on an attached Android device or emulator using Yarn. It automates the process of compiling native code and deploying the JavaScript bundle, similar to `npm run android`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/_getting-started-macos-android.md#_snippet_9

LANGUAGE: Shell
CODE:

```
yarn android
```

---

TITLE: React Native Flexbox Layout App Component in TypeScript
DESCRIPTION: This comprehensive TypeScript React Native `App` component demonstrates interactive manipulation of Flexbox layout properties. Users can change `flexDirection`, `justifyContent`, `alignItems`, `direction`, and `flexWrap` via buttons, observing their effects on dynamically added/removed `Square` components. It uses `useState` for state management and `SafeAreaView` for safe area handling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/layout-props.md#_snippet_2

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {
  Button,
  ScrollView,
  StyleSheet,
  Text,
  View,
  FlexAlignType,
  FlexStyle,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [flexDirection, setFlexDirection] = useState(0);
  const [justifyContent, setJustifyContent] = useState(0);
  const [alignItems, setAlignItems] = useState(0);
  const [direction, setDirection] = useState(0);
  const [wrap, setWrap] = useState(0);

  const [squares, setSquares] = useState([<Square />, <Square />, <Square />]);

  const hookedStyles = {
    flexDirection: flexDirections[flexDirection],
    justifyContent: justifyContents[justifyContent],
    alignItems: alignItemsArr[alignItems],
    direction: directions[direction],
    flexWrap: wraps[wrap],
  } as FlexStyle;

  const changeSetting = (
    value: number,
    options: any[],
    setterFunction: (index: number) => void,
  ) => {
    if (value === options.length - 1) {
      setterFunction(0);
      return;
    }
    setterFunction(value + 1);
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={[styles.container, styles.playingSpace, hookedStyles]}>
          {squares.map(elem => elem)}
        </View>
        <ScrollView style={styles.layoutContainer}>
          <View style={styles.controlSpace}>
            <View style={styles.buttonView}>
              <Button
                title="Change Flex Direction"
                onPress={() =>
                  changeSetting(flexDirection, flexDirections, setFlexDirection)
                }
              />
              <Text style={styles.text}>{flexDirections[flexDirection]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Justify Content"
                onPress={() =>
                  changeSetting(
                    justifyContent,
                    justifyContents,
                    setJustifyContent,
                  )
                }
              />
              <Text style={styles.text}>{justifyContents[justifyContent]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Align Items"
                onPress={() =>
                  changeSetting(alignItems, alignItemsArr, setAlignItems)
                }
              />
              <Text style={styles.text}>{alignItemsArr[alignItems]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Direction"
                onPress={() =>
                  changeSetting(direction, directions, setDirection)
                }
              />
              <Text style={styles.text}>{directions[direction]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Flex Wrap"
                onPress={() => changeSetting(wrap, wraps, setWrap)}
              />
              <Text style={styles.text}>{wraps[wrap]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Add Square"
                onPress={() => setSquares([...squares, <Square />])}
              />
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Delete Square"
                onPress={() =>
                  setSquares(squares.filter((v, i) => i !== squares.length - 1))
                }
              />
            </View>
          </View>
        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};
```

---

TITLE: Creating a New React Native Project (CLI)
DESCRIPTION: This command uses `npx` to execute the React Native CLI and initialize a new project named 'AwesomeProject'. `npx` ensures that the current stable version of the CLI is downloaded and used without requiring a global installation.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/_getting-started-macos-android.md#_snippet_4

LANGUAGE: shell
CODE:

```
npx react-native init AwesomeProject
```

---

TITLE: Customizing Components with Props in React Native
DESCRIPTION: This example illustrates how to use `props` to customize React Native components. It defines a `Greeting` functional component that accepts a `name` prop to render personalized greetings and demonstrates reusing this component multiple times with different `name` values. It also shows basic styling with `StyleSheet`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/tutorial.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import { Text, View, StyleSheet } from 'react-native';

const styles = StyleSheet.create({
  center: {
    alignItems: 'center'
  }
})

const Greeting = (props) => {
  return (
    <View style={styles.center}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
}

const LotsOfGreetings = () => {
  return (
    <View style={[styles.center, {top: 50}]}>
      <Greeting name='Rexxar' />
      <Greeting name='Jaina' />
      <Greeting name='Valeera' />
    </View>
  );
}

export default LotsOfGreetings;
```

---

TITLE: Embedding JavaScript Variables in JSX
DESCRIPTION: This example illustrates how to embed a JavaScript variable within JSX using curly braces. The `name` variable is declared and its value is dynamically inserted into the `Text` element, demonstrating JSX's ability to combine markup with JavaScript expressions.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/intro-react.md#_snippet_5

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const Cat = () => {
  const name = 'Maru';
  return <Text>Hello, I am {name}!</Text>;
};

export default Cat;
```

---

TITLE: Declaring State Variable with useState in React
DESCRIPTION: This snippet illustrates how to declare a state variable `isHungry` and its corresponding setter function `setIsHungry` using the `useState` Hook. It initializes `isHungry` to `true` and is typically called inside a functional component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/intro-react.md#_snippet_16

LANGUAGE: typescript
CODE:

```
const Cat = (props: CatProps) => {
  const [isHungry, setIsHungry] = useState(true);
  // ...
};
```

---

TITLE: Navigating Between Screens and Passing Params (React Native)
DESCRIPTION: Illustrates how to navigate from `HomeScreen` to `ProfileScreen` using `navigation.navigate` and pass parameters (e.g., `name: 'Jane'`). The `ProfileScreen` then accesses these parameters via `route.params` to display dynamic content.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/navigation.md#_snippet_6

LANGUAGE: typescript
CODE:

```
const HomeScreen = ({navigation}) => {
  return (
    <Button
      title="Go to Jane's profile"
      onPress={() =>
        navigation.navigate('Profile', {name: 'Jane'})
      }
    />
  );
};
const ProfileScreen = ({navigation, route}) => {
  return <Text>This is {route.params.name}'s profile</Text>;
};
```

---

TITLE: Registering a Root Component with AppRegistry (TSX)
DESCRIPTION: This snippet demonstrates how to register a root React Native component with `AppRegistry.registerComponent`. It imports `Text` and `AppRegistry` from 'react-native', defines a simple functional component `App`, and then registers it under the key 'Appname'. This is the standard way to make a React Native component available to the native application shell.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/appregistry.md#_snippet_0

LANGUAGE: tsx
CODE:

```
import {Text, AppRegistry} from 'react-native';

const App = () => (
  <View>
    <Text>App1</Text>
  </View>
);

AppRegistry.registerComponent('Appname', () => App);
```

---

TITLE: Implementing a Counter with TouchableOpacity in React Native
DESCRIPTION: This example demonstrates how to use `TouchableOpacity` in React Native to create a simple counter. It shows state management with `useState`, styling with `StyleSheet`, and how `TouchableOpacity` can wrap a `Text` component to make it pressable, incrementing a counter on each press. It also utilizes `SafeAreaView` and `SafeAreaProvider` for proper layout on different devices.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/touchableopacity.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React, {useState} from 'react';
import {StyleSheet, Text, TouchableOpacity, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [count, setCount] = useState(0);
  const onPress = () => setCount(prevCount => prevCount + 1);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={styles.countContainer}>
          <Text>Count: {count}</Text>
        </View>
        <TouchableOpacity style={styles.button} onPress={onPress}>
          <Text>Press Here</Text>
        </TouchableOpacity>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 10,
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
  },
  countContainer: {
    alignItems: 'center',
    padding: 10,
  },
});

export default App;
```

---

TITLE: Implementing Pull-to-Refresh with RefreshControl in React Native
DESCRIPTION: This example demonstrates how to integrate `RefreshControl` into a `ScrollView` to provide pull-to-refresh functionality. It uses React's `useState` to manage the `refreshing` state and `useCallback` for the `onRefresh` handler, which simulates a data refresh with a timeout. The `RefreshControl` component is passed as a prop to the `ScrollView`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/refreshcontrol.md#_snippet_0

LANGUAGE: React Native
CODE:

```
import React from 'react';
import {RefreshControl, ScrollView, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [refreshing, setRefreshing] = React.useState(false);

  const onRefresh = React.useCallback(() => {
    setRefreshing(true);
    setTimeout(() => {
      setRefreshing(false);
    }, 2000);
  }, []);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <ScrollView
          contentContainerStyle={styles.scrollView}
          refreshControl={
            <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
          }>
          <Text>Pull down to see RefreshControl indicator</Text>
        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  scrollView: {
    flex: 1,
    backgroundColor: 'pink',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;
```

---

TITLE: Passing Props to Custom Components (JavaScript)
DESCRIPTION: This snippet illustrates how to pass properties (props) to a custom `Cat` component in JavaScript. Each `Cat` instance receives a different `name` prop, allowing for customization and dynamic content based on parent-provided data.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/intro-react.md#_snippet_10

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const Cat = props => {
  return (
    <View>
      <Text>Hello, I am {props.name}!</Text>
    </View>
  );
};

const Cafe = () => {
  return (
    <View>
      <Cat name="Maru" />
      <Cat name="Jellylorum" />
      <Cat name="Spot" />
    </View>
  );
};

export default Cafe;
```

---

TITLE: Initializing a New React Native Project
DESCRIPTION: This command uses `npx` to initialize a new React Native project named 'AwesomeProject' with the latest stable version of the React Native CLI. `npx` allows running the CLI without a global installation, ensuring the use of the most current version.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/_getting-started-macos-android.md#_snippet_4

LANGUAGE: Shell
CODE:

```
npx react-native@latest init AwesomeProject
```

---

TITLE: Creating a Basic React Native Component
DESCRIPTION: This snippet defines a simple functional component named `Cat` that renders a `Text` element with a static greeting. It demonstrates the basic structure of a React Native component and its export for use in an application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/intro-react.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const Cat = () => {
  return <Text>Hello, I am your cat!</Text>;
};

export default Cat;
```

---

TITLE: Starting Metro Bundler with npm for React Native
DESCRIPTION: This command initiates the Metro development server using npm, which is essential for bundling JavaScript code and serving it to the React Native application during development. It should be executed from the root directory of the React Native project.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/_integration-with-existing-apps-java.md#_snippet_21

LANGUAGE: shell
CODE:

```
npm start
```

---

TITLE: Comprehensive React Native Button Examples
DESCRIPTION: This extensive example showcases various configurations of the React Native `Button` component. It includes a basic button with an `Alert`, a button with an adjusted `color`, a `disabled` button, and a layout demonstrating two buttons side-by-side using `flexDirection: 'row'`. It also defines a `Separator` component and uses `SafeAreaView` for proper layout.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/button.md#_snippet_1

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {StyleSheet, Button, View, Text, Alert} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const Separator = () => <View style={styles.separator} />;

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <View>
        <Text style={styles.title}>
          The title and onPress handler are required. It is recommended to set
          accessibilityLabel to help make your app usable by everyone.
        </Text>
        <Button
          title="Press me"
          onPress={() => Alert.alert('Simple Button pressed')}
        />
      </View>
      <Separator />
      <View>
        <Text style={styles.title}>
          Adjust the color in a way that looks standard on each platform. On
          iOS, the color prop controls the color of the text. On Android, the
          color adjusts the background color of the button.
        </Text>
        <Button
          title="Press me"
          color="#f194ff"
          onPress={() => Alert.alert('Button with adjusted color pressed')}
        />
      </View>
      <Separator />
      <View>
        <Text style={styles.title}>
          All interaction for the component are disabled.
        </Text>
        <Button
          title="Press me"
          disabled
          onPress={() => Alert.alert('Cannot press this one')}
        />
      </View>
      <Separator />
      <View>
        <Text style={styles.title}>
          This layout strategy lets the title define the width of the button.
        </Text>
        <View style={styles.fixToText}>
          <Button
            title="Left button"
            onPress={() => Alert.alert('Left button pressed')}
          />
          <Button
            title="Right button"
            onPress={() => Alert.alert('Right button pressed')}
          />
        </View>
      </View>
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    marginHorizontal: 16,
  },
  title: {
    textAlign: 'center',
    marginVertical: 8,
  },
  fixToText: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  separator: {
    marginVertical: 8,
    borderBottomColor: '#737373',
    borderBottomWidth: StyleSheet.hairlineWidth,
  },
});

export default App;
```

---

TITLE: Demonstrating alignItems in React Native (TypeScript)
DESCRIPTION: This TypeScript snippet demonstrates the `alignItems` style property in React Native, similar to the JavaScript example but with added type safety. It utilizes `useState` to manage the `alignItems` value and a `PreviewLayout` component to showcase the visual impact of `stretch`, `flex-start`, `flex-end`, `center`, and `baseline` on child alignment within a container. Type definitions are included for `PreviewLayoutProps` to enhance code clarity and maintainability.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/flexbox.md#_snippet_7

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';
import type {PropsWithChildren} from 'react';

const AlignItemsLayout = () => {
  const [alignItems, setAlignItems] = useState('stretch');

  return (
    <PreviewLayout
      label="alignItems"
      selectedValue={alignItems}
      values={['stretch', 'flex-start', 'flex-end', 'center', 'baseline']}
      setSelectedValue={setAlignItems}>
      <View style={[styles.box, {backgroundColor: 'powderblue'}]} />
      <View style={[styles.box, {backgroundColor: 'skyblue'}]} />
      <View
        style={[
          styles.box,
          {
            backgroundColor: 'steelblue',
            width: 'auto',
            minWidth: 50,
          },
        ]}
      />
    </PreviewLayout>
  );
};

type PreviewLayoutProps = PropsWithChildren<{
  label: string;
  values: string[];
  selectedValue: string;
  setSelectedValue: (value: string) => void;
}>;

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}: PreviewLayoutProps) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
    minHeight: 200,
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default AlignItemsLayout;
```

---

TITLE: Installing Node and Watchman with Homebrew (Shell)
DESCRIPTION: This command installs Node.js and Watchman using Homebrew, a package manager for macOS. Node.js is required for running JavaScript, and Watchman is recommended for monitoring file changes for better performance in React Native development.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/_getting-started-macos-ios.md#_snippet_0

LANGUAGE: shell
CODE:

```
brew install node
brew install watchman
```

---

TITLE: Controlling React Native Layout with Flex Properties (JavaScript)
DESCRIPTION: This React Native example demonstrates the dynamic control of layout properties such as `flexDirection`, `justifyContent`, `alignItems`, `direction`, and `flexWrap`. Users can interactively change these properties and add/remove squares to observe their effect on the UI arrangement. It utilizes React Hooks for state management and `SafeAreaView` for proper screen rendering.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/layout-props.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {Button, ScrollView, StyleSheet, Text, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [flexDirection, setFlexDirection] = useState(0);
  const [justifyContent, setJustifyContent] = useState(0);
  const [alignItems, setAlignItems] = useState(0);
  const [direction, setDirection] = useState(0);
  const [wrap, setWrap] = useState(0);

  const [squares, setSquares] = useState([<Square />, <Square />, <Square />]);

  const hookedStyles = {
    flexDirection: flexDirections[flexDirection],
    justifyContent: justifyContents[justifyContent],
    alignItems: alignItemsArr[alignItems],
    direction: directions[direction],
    flexWrap: wraps[wrap],
  };

  const changeSetting = (value, options, setterFunction) => {
    if (value === options.length - 1) {
      setterFunction(0);
      return;
    }
    setterFunction(value + 1);
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={[styles.container, styles.playingSpace, hookedStyles]}>
          {squares.map(elem => elem)}
        </View>
        <ScrollView style={styles.layoutContainer}>
          <View style={styles.controlSpace}>
            <View style={styles.buttonView}>
              <Button
                title="Change Flex Direction"
                onPress={() =>
                  changeSetting(flexDirection, flexDirections, setFlexDirection)
                }
              />
              <Text style={styles.text}>{flexDirections[flexDirection]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Justify Content"
                onPress={() =>
                  changeSetting(
                    justifyContent,
                    justifyContents,
                    setJustifyContent,
                  )
                }
              />
              <Text style={styles.text}>{justifyContents[justifyContent]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Align Items"
                onPress={() =>
                  changeSetting(alignItems, alignItemsArr, setAlignItems)
                }
              />
              <Text style={styles.text}>{alignItemsArr[alignItems]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Direction"
                onPress={() =>
                  changeSetting(direction, directions, setDirection)
                }
              />
              <Text style={styles.text}>{directions[direction]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Change Flex Wrap"
                onPress={() => changeSetting(wrap, wraps, setWrap)}
              />
              <Text style={styles.text}>{wraps[wrap]}</Text>
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Add Square"
                onPress={() => setSquares([...squares, <Square />])}
              />
            </View>
            <View style={styles.buttonView}>
              <Button
                title="Delete Square"
                onPress={() =>
                  setSquares(squares.filter((v, i) => i !== squares.length - 1))
                }
              />
            </View>
          </View>
        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const flexDirections = ['row', 'row-reverse', 'column', 'column-reverse'];
const justifyContents = [
  'flex-start',
  'flex-end',
  'center',
  'space-between',
  'space-around',
  'space-evenly',
];
const alignItemsArr = [
  'flex-start',
  'flex-end',
  'center',
  'stretch',
  'baseline',
];
const wraps = ['nowrap', 'wrap', 'wrap-reverse'];
const directions = ['inherit', 'ltr', 'rtl'];

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  layoutContainer: {
    flex: 0.5,
  },
  playingSpace: {
    backgroundColor: 'white',
    borderColor: 'blue',
    borderWidth: 3,
    overflow: 'hidden',
  },
  controlSpace: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  buttonView: {
    width: '50%',
    padding: 10,
  },
  text: {
    textAlign: 'center',
  },
});

const Square = () => (
  <View
    style={{
      width: 50,
      height: 50,
      backgroundColor: randomHexColor(),
    }}
  />
);
```

---

TITLE: Configuring Android Environment Variables for React Native (Shell)
DESCRIPTION: This shell script snippet sets up essential environment variables (`ANDROID_HOME` and `PATH`) required by React Native tools to build applications with native Android code. `ANDROID_HOME` points to the Android SDK directory, and `PATH` is extended to include the `emulator` and `platform-tools` directories, enabling command-line access to Android development tools. Users need to add these lines to their shell configuration file (e.g., `.bash_profile`, `.bashrc`, `.zprofile`, or `.zshrc`) and then source the file.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/_getting-started-linux-android.md#_snippet_0

LANGUAGE: shell
CODE:

```
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

---

TITLE: Applying Flex Property in React Native
DESCRIPTION: This snippet demonstrates how the `flex` property distributes available space among child components within a container. The container has `flex: 1`, and its children have `flex: 1`, `flex: 2`, and `flex: 3` respectively, resulting in a 1/6, 2/6, and 3/6 division of space along the main axis. It uses `flexDirection: 'column'` by default.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/flexbox.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {StyleSheet, View} from 'react-native';

const Flex = () => {
  return (
    <View
      style={[
        styles.container,
        {
          // Try setting `flexDirection` to `"row"`.
          flexDirection: 'column',
        },
      ]}>
      <View style={{flex: 1, backgroundColor: 'red'}} />
      <View style={{flex: 2, backgroundColor: 'darkorange'}} />
      <View style={{flex: 3, backgroundColor: 'green'}} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
});

export default Flex;
```

---

TITLE: Opening URLs and Deep Links in React Native (TypeScript)
DESCRIPTION: This TypeScript React Native component demonstrates how to open URLs using `Linking.canOpenURL` and `Linking.openURL`, similar to the JavaScript example but with type definitions for improved code clarity and error checking. It checks for URL scheme support before opening, alerting the user if the link cannot be handled, ensuring robust deep link and external URL management.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/linking.md#_snippet_5

LANGUAGE: TypeScript
CODE:

```
import React, {useCallback} from 'react';
import {Alert, Button, Linking, StyleSheet, View} from 'react-native';

const supportedURL = 'https://google.com';

const unsupportedURL = 'slack://open?team=123456';

type OpenURLButtonProps = {
  url: string;
  children: string;
};

const OpenURLButton = ({url, children}: OpenURLButtonProps) => {
  const handlePress = useCallback(async () => {
    // Checking if the link is supported for links with custom URL scheme.
    const supported = await Linking.canOpenURL(url);

    if (supported) {
      // Opening the link with some app, if the URL scheme is "http" the web link should be opened
      // by some browser in the mobile
      await Linking.openURL(url);
    } else {
      Alert.alert(`Don't know how to open this URL: ${url}`);
    }
  }, [url]);

  return <Button title={children} onPress={handlePress} />;
};

const App = () => {
  return (
    <View style={styles.container}>
      <OpenURLButton url={supportedURL}>Open Supported URL</OpenURLButton>
      <OpenURLButton url={unsupportedURL}>Open Unsupported URL</OpenURLButton>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default App;
```

---

TITLE: Requesting Camera Permission in React Native
DESCRIPTION: This example demonstrates how to request the `CAMERA` permission using `PermissionsAndroid.request`. It includes a `rationale` object to explain why the permission is needed, which is displayed if the user has previously denied the request. The function logs whether the permission was granted or denied.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/permissionsandroid.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {
  Button,
  PermissionsAndroid,
  StatusBar,
  StyleSheet,
  Text,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const requestCameraPermission = async () => {
  try {
    const granted = await PermissionsAndroid.request(
      PermissionsAndroid.PERMISSIONS.CAMERA,
      {
        title: 'Cool Photo App Camera Permission',
        message:
          'Cool Photo App needs access to your camera ' +
          'so you can take awesome pictures.',
        buttonNeutral: 'Ask Me Later',
        buttonNegative: 'Cancel',
        buttonPositive: 'OK',
      },
    );
    if (granted === PermissionsAndroid.RESULTS.GRANTED) {
      console.log('You can use the camera');
    } else {
      console.log('Camera permission denied');
    }
  } catch (err) {
    console.warn(err);
  }
};

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Text style={styles.item}>Try permissions</Text>
      <Button title="request permissions" onPress={requestCameraPermission} />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingTop: StatusBar.currentHeight,
    backgroundColor: '#ecf0f1',
    padding: 8,
  },
  item: {
    margin: 24,
    fontSize: 18,
    fontWeight: 'bold',
    textAlign: 'center',
  },
});

export default App;
```

---

TITLE: Defining a Functional Component in React Native
DESCRIPTION: This snippet illustrates the basic syntax for defining a functional component in React Native using a JavaScript arrow function. Components are essentially blueprints for UI elements.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/intro-react.md#_snippet_2

LANGUAGE: typescript
CODE:

```
const Cat = () => {};
```

---

TITLE: Navigating Between Screens with Parameters (React Native)
DESCRIPTION: Demonstrates how to navigate from `HomeScreen` to `ProfileScreen` using `navigation.navigate` and pass parameters. `ProfileScreen` then accesses these parameters via `route.params` to display dynamic content.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/navigation.md#_snippet_6

LANGUAGE: typescript
CODE:

```
const HomeScreen = ({navigation}) => {
  return (
    <Button
      title="Go to Jane's profile"
      onPress={() =>
        navigation.navigate('Profile', {name: 'Jane'})
      }
    />
  );
};
const ProfileScreen = ({navigation, route}) => {
  return <Text>This is {route.params.name}'s profile</Text>;
};
```

---

TITLE: Using Various Touchable Components in React Native (JavaScript)
DESCRIPTION: This comprehensive example demonstrates the usage of various 'Touchable' components in React Native, including TouchableHighlight, TouchableOpacity, TouchableNativeFeedback, and TouchableWithoutFeedback. It illustrates how to handle both onPress and onLongPress events, providing different visual feedback mechanisms for each component and addressing platform-specific behaviors like Android's ripple effect.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/handling-touches.md#_snippet_2

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {
  Alert,
  Platform,
  StyleSheet,
  Text,
  TouchableHighlight,
  TouchableOpacity,
  TouchableNativeFeedback,
  TouchableWithoutFeedback,
  View,
} from 'react-native';

const Touchables = () => {
  const onPressButton = () => {
    Alert.alert('You tapped the button!');
  };

  const onLongPressButton = () => {
    Alert.alert('You long-pressed the button!');
  };

  return (
    <View style={styles.container}>
      <TouchableHighlight onPress={onPressButton} underlayColor="white">
        <View style={styles.button}>
          <Text style={styles.buttonText}>TouchableHighlight</Text>
        </View>
      </TouchableHighlight>
      <TouchableOpacity onPress={onPressButton}>
        <View style={styles.button}>
          <Text style={styles.buttonText}>TouchableOpacity</Text>
        </View>
      </TouchableOpacity>
      <TouchableNativeFeedback
        onPress={onPressButton}
        background={
          Platform.OS === 'android'
            ? TouchableNativeFeedback.SelectableBackground()
            : undefined
        }>
        <View style={styles.button}>
          <Text style={styles.buttonText}>
            TouchableNativeFeedback{' '}
            {Platform.OS !== 'android' ? '(Android only)' : ''}
          </Text>
        </View>
      </TouchableNativeFeedback>
      <TouchableWithoutFeedback onPress={onPressButton}>
        <View style={styles.button}>
          <Text style={styles.buttonText}>TouchableWithoutFeedback</Text>
        </View>
      </TouchableWithoutFeedback>
      <TouchableHighlight
        onPress={onPressButton}
        onLongPress={onLongPressButton}
        underlayColor="white">
        <View style={styles.button}>
          <Text style={styles.buttonText}>Touchable with Long Press</Text>
        </View>
      </TouchableHighlight>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    paddingTop: 60,
    alignItems: 'center',
  },
  button: {
    marginBottom: 30,
    width: 260,
    alignItems: 'center',
    backgroundColor: '#2196F3',
  },
  buttonText: {
    textAlign: 'center',
    padding: 20,
    color: 'white',
  },
});

export default Touchables;
```

---

TITLE: Distributing Space with Flex Property in React Native
DESCRIPTION: This snippet demonstrates how the `flex` property in React Native distributes available space among sibling components within a container. The space is divided proportionally based on each child's `flex` value, allowing for dynamic sizing. For example, `flex: 1`, `flex: 2`, `flex: 3` will allocate 1/6, 2/6, and 3/6 of the space respectively.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/flexbox.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from "react";
import { StyleSheet, Text, View } from "react-native";

const Flex = () => {
  return (
    <View style={[
      styles.container, {
      // Try setting `flexDirection` to `"row"`.
      flexDirection: "column"
    }
    ]}>
      <View style={{ flex: 1, backgroundColor: "red" }} />
      <View style={{ flex: 2, backgroundColor: "darkorange" }} />
      <View style={{ flex: 3, backgroundColor: "green" }} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
});

export default Flex;
```

---

TITLE: Complete React Native Fetch Example (JavaScript)
DESCRIPTION: This comprehensive JavaScript snippet demonstrates a full React Native application that fetches data from an API using 'async'/'await' with Fetch. It manages loading states, displays data in a 'FlatList', and includes 'useEffect' for data fetching on component mount.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/network.md#_snippet_4

LANGUAGE: javascript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Creating a Basic View Component in React Native
DESCRIPTION: This snippet demonstrates how to create a basic React Native `View` component that wraps two colored boxes and a text component. It utilizes `SafeAreaProvider` and `SafeAreaView` for handling safe areas and `flexDirection` for row-based layout. This example showcases the fundamental usage of `View` for UI construction.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/view.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const ViewBoxesWithColorAndText = () => {
  return (
    <SafeAreaProvider>
      <SafeAreaView style={{height: 100, flexDirection: 'row'}}>
        <View style={{backgroundColor: 'blue', flex: 0.2}} />
        <View style={{backgroundColor: 'red', flex: 0.4}} />
        <Text>Hello World!</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

export default ViewBoxesWithColorAndText;
```

---

TITLE: Passing Props to Custom Components in React Native (TypeScript)
DESCRIPTION: This TypeScript example demonstrates defining a custom `Greeting` component that accepts a `name` prop, explicitly typing the props using `GreetingProps`. The `LotsOfGreetings` component reuses `Greeting` with different `name` values, highlighting type-safe prop usage in React Native.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/props.md#_snippet_2

LANGUAGE: typescript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

type GreetingProps = {
  name: string;
};

const Greeting = (props: GreetingProps) => {
  return (
    <View style={{alignItems: 'center'}}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={{alignItems: 'center', top: 50}}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Creating a Basic 'Hello World' App in React Native
DESCRIPTION: This snippet demonstrates a fundamental 'Hello World' application in React Native. It imports `React` for JSX and `Text` and `View` components from `react-native`. The `HelloWorldApp` functional component renders a `View` container styled to center its content, which includes a `Text` component displaying 'Hello, world!'.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/tutorial.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const HelloWorldApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Hello, world!</Text>
    </View>
  );
};
export default HelloWorldApp;
```

---

TITLE: Creating a Basic React Native App with SnackPlayer
DESCRIPTION: This snippet demonstrates a fundamental 'Hello World' React Native application using the SnackPlayer. It showcases how to import `React`, `Text`, and `View` components from `react-native` to construct a simple UI that displays centered text. This interactive example allows users to directly modify and observe the code's output in a browser.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/introduction.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const YourApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Try editing me! 🎉</Text>
    </View>
  );
};

export default YourApp;
```

---

TITLE: Complete React Native Fetch Example (TypeScript)
DESCRIPTION: This comprehensive TypeScript snippet demonstrates a full React Native application that fetches data from an API using 'async'/'await' with Fetch. It includes type definitions for the fetched data, manages loading states, displays data in a 'FlatList', and uses 'useEffect' for data fetching on component mount.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/network.md#_snippet_5

LANGUAGE: typescript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

type Movie = {
  id: string;
  title: string;
  releaseYear: string;
};

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState<Movie[]>([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Updating State via Button Press (React Native)
DESCRIPTION: Demonstrates how to update a component's state by calling the state-setting function (`setIsHungry`) within a `Button`'s `onPress` prop. This interaction triggers a re-render of the component with the new state value.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/intro-react.md#_snippet_17

LANGUAGE: tsx
CODE:

```
<Button
  onPress={() => {
    setIsHungry(false);
  }}
  //..
/>
```

---

TITLE: Displaying Various Image Types in React Native
DESCRIPTION: This example demonstrates how to display different types of images using the `Image` component in React Native, including static local assets, network images, and images from a base64 data URI. It also shows basic styling with `StyleSheet`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/image.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Image, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  tinyLogo: {
    width: 50,
    height: 50,
  },
  logo: {
    width: 66,
    height: 58,
  },
});

const DisplayAnImage = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Image
        style={styles.tinyLogo}
        source={require('@expo/snack-static/react-native-logo.png')}
      />
      <Image
        style={styles.tinyLogo}
        source={{
          uri: 'https://reactnative.dev/img/tiny_logo.png',
        }}
      />
      <Image
        style={styles.logo}
        source={{
          uri: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADMAAAAzCAYAAAA6oTAqAAAAEXRFWHRTb2Z0d2FyZQBwbmdjcnVzaEB1SfMAAABQSURBVGje7dSxCQBACARB+2/ab8BEeQNhFi6WSYzYLYudDQYGBgYGBgYGBgYGBgYGBgZmcvDqYGBgmhivGQYGBgYGBgYGBgYGBgYGBgbmQw+P/eMrC5UTVAAAAABJRU5ErkJggg==',
        }}
      />
    </SafeAreaView>
  </SafeAreaProvider>
);

export default DisplayAnImage;
```

---

TITLE: Creating a Basic Hello World App in React Native
DESCRIPTION: This snippet demonstrates a minimal "Hello, world!" application in React Native. It imports `React` and core components `Text` and `View` from `react-native`. The `HelloWorldApp` functional component renders a `View` container styled to center its content, which includes a `Text` component displaying "Hello, world!".
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/tutorial.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const HelloWorldApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Hello, world!</Text>
    </View>
  );
};
export default HelloWorldApp;
```

---

TITLE: Registering a Root Component with AppRegistry (TypeScript)
DESCRIPTION: This snippet demonstrates how to register a root React Native component using `AppRegistry.registerComponent`. This function is the primary way to make a JavaScript component available to the native system, serving as the entry point for the application. It takes an `appKey` (a string identifier) and a component provider function that returns the root component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/appregistry.md#_snippet_0

LANGUAGE: tsx
CODE:

```
import {Text, AppRegistry} from 'react-native';

const App = () => (
  <View>
    <Text>App1</Text>
  </View>
);

AppRegistry.registerComponent('Appname', () => App);
```

---

TITLE: Creating Multi-Button Alerts in React Native
DESCRIPTION: This example demonstrates how to create and display alert dialogs with two or three buttons using `Alert.alert()`. It shows how to define button text, `onPress` callbacks, and `style` properties (e.g., 'cancel') for different button configurations. The `SafeAreaView` and `SafeAreaProvider` are used for proper layout.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/alert.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {StyleSheet, Button, Alert} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const createTwoButtonAlert = () =>
    Alert.alert('Alert Title', 'My Alert Msg', [
      {
        text: 'Cancel',
        onPress: () => console.log('Cancel Pressed'),
        style: 'cancel',
      },
      {text: 'OK', onPress: () => console.log('OK Pressed')},
    ]);

  const createThreeButtonAlert = () =>
    Alert.alert('Alert Title', 'My Alert Msg', [
      {
        text: 'Ask me later',
        onPress: () => console.log('Ask me later pressed'),
      },
      {
        text: 'Cancel',
        onPress: () => console.log('Cancel Pressed'),
        style: 'cancel',
      },
      {text: 'OK', onPress: () => console.log('OK Pressed')},
    ]);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Button title={'2-Button Alert'} onPress={createTwoButtonAlert} />
        <Button title={'3-Button Alert'} onPress={createThreeButtonAlert} />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-around',
    alignItems: 'center',
  },
});

export default App;
```

---

TITLE: Using Props for Component Customization in React Native (JavaScript)
DESCRIPTION: This example illustrates the use of `props` to customize React Native components. It defines a `Greeting` functional component that accepts a `name` prop to display personalized greetings. The `LotsOfGreetings` component reuses `Greeting` multiple times with different `name` values, demonstrating component reusability and basic styling with `StyleSheet`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/tutorial.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View, StyleSheet} from 'react-native';

const styles = StyleSheet.create({
  center: {
    alignItems: 'center',
  },
});

const Greeting = props => {
  return (
    <View style={styles.center}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={[styles.center, {top: 50}]}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Running Android App with npm
DESCRIPTION: This bash command uses `npm` to build and run the React Native Android application on an attached emulator or device. It's a common command for developers to quickly test their changes during development. Ensure you have an Android emulator running or a device connected and configured for debugging.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/turbo-native-modules-android.md#_snippet_1

LANGUAGE: bash
CODE:

```
npm run android
```

---

TITLE: Passing and Using Props in React Components (JS)
DESCRIPTION: This JavaScript snippet demonstrates how to pass and utilize `props` to customize child components. The `Cafe` component passes a unique `name` prop to each `Cat` instance, allowing each `Cat` component to render a different name dynamically.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/intro-react.md#_snippet_10

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const Cat = props => {
  return (
    <View>
      <Text>Hello, I am {props.name}!</Text>
    </View>
  );
};

const Cafe = () => {
  return (
    <View>
      <Cat name="Maru" />
      <Cat name="Jellylorum" />
      <Cat name="Spot" />
    </View>
  );
};

export default Cafe;
```

---

TITLE: Persisting Data with AsyncStorage in React Native
DESCRIPTION: This asynchronous function shows how to store a string value associated with a specific key using `AsyncStorage.setItem()`. It includes a try-catch block for basic error handling during the data saving process.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/asyncstorage.md#_snippet_1

LANGUAGE: jsx
CODE:

```
_storeData = async () => {
  try {
    await AsyncStorage.setItem(
      '@MySuperStore:key',
      'I like to save it.',
    );
  } catch (error) {
    // Error saving data
  }
};
```

---

TITLE: Starting React Native Metro Bundler (Yarn)
DESCRIPTION: This shell command snippet demonstrates how to start the Metro bundler using Yarn. Running `yarn start` in the project's root directory launches the Metro HTTP server, which bundles the TypeScript/JavaScript application code and serves it to a simulator or device, enabling features like hot reloading.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/_integration-with-existing-apps-kotlin.md#_snippet_18

LANGUAGE: Shell
CODE:

```
yarn start
```

---

TITLE: Importing React and React Native Core Components
DESCRIPTION: This code snippet shows the necessary import statements for creating a React Native component. It imports the `React` library and the `Text` Core Component from `react-native`, which is essential for building UI elements.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/intro-react.md#_snippet_1

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {Text} from 'react-native';
```

---

TITLE: Creating Custom Components with Props in React Native (TypeScript)
DESCRIPTION: This TypeScript snippet demonstrates defining and using custom components with typed `props` in React Native. It defines a `GreetingProps` type for the `name` prop, ensuring type safety. The `Greeting` component accepts these typed props to display a personalized message, and `LotsOfGreetings` reuses it with different names, showcasing type-safe component reusability.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/props.md#_snippet_2

LANGUAGE: typescript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

type GreetingProps = {
  name: string;
};

const Greeting = (props: GreetingProps) => {
  return (
    <View style={{alignItems: 'center'}}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={{alignItems: 'center', top: 50}}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Using Flex Dimensions for Dynamic Sizing in React Native
DESCRIPTION: This example illustrates how to use the `flex` property in React Native to enable components to dynamically expand or shrink based on available space. The `flex` value determines the ratio of space a component takes relative to its siblings, requiring a parent with defined dimensions for children to be visible.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/height-and-width.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View} from 'react-native';

const FlexDimensionsBasics = () => {
  return (
    // Try removing the `flex: 1` on the parent View.
    // The parent will not have dimensions, so the children can't expand.
    // What if you add `height: 300` instead of `flex: 1`?
    <View style={{flex: 1}}>
      <View style={{flex: 1, backgroundColor: 'powderblue'}} />
      <View style={{flex: 2, backgroundColor: 'skyblue'}} />
      <View style={{flex: 3, backgroundColor: 'steelblue'}} />
    </View>
  );
};

export default FlexDimensionsBasics;
```

---

TITLE: Implementing a Counter with useState Hook in React Native
DESCRIPTION: This snippet provides a React Native equivalent of the counter application, also using the `useState` hook for state management. It demonstrates how to use React Native's `View`, `Text`, and `Button` components, along with `StyleSheet` for styling, to create an interactive counter that updates the displayed count on button press.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/tutorial.md#_snippet_4

LANGUAGE: TypeScript
CODE:

```
// React Native Counter Example using Hooks!

import React, {useState} from 'react';
import {View, Text, Button, StyleSheet} from 'react-native';

const App = () => {
  const [count, setCount] = useState(0);

  return (
    <View style={styles.container}>
      <Text>You clicked {count} times</Text>
      <Button
        onPress={() => setCount(count + 1)}
        title="Click me!"
      />
    </View>
  );
};

// React Native Styles
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
```

---

TITLE: Registering a Root Component with AppRegistry (TypeScript)
DESCRIPTION: This snippet demonstrates how to register a root React Native component with `AppRegistry`. The `registerComponent` method links a JavaScript component to a native app key, making it runnable by the native system. It requires `AppRegistry` and the component itself.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/appregistry.md#_snippet_0

LANGUAGE: TypeScript
CODE:

```
import {Text, AppRegistry} from 'react-native';

const App = () => (
  <View>
    <Text>App1</Text>
  </View>
);

AppRegistry.registerComponent('Appname', () => App);
```

---

TITLE: Implementing Asynchronous Functions with `async`/`await` (ES8)
DESCRIPTION: Demonstrates the `async`/`await` syntax for writing asynchronous code that looks synchronous. An `async` function can `await` a Promise, pausing execution until the Promise settles.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/javascript-environment.md#_snippet_21

LANGUAGE: JavaScript
CODE:

```
async function doStuffAsync() {const foo = await doOtherStuffAsync();};
```

---

TITLE: Customizing Core Components with Props (Image)
DESCRIPTION: This snippet demonstrates customizing React Native's `Image` Core Component using its `source` and `style` props. The `source` prop specifies the image URI, and the `style` prop defines its dimensions, showcasing how to configure built-in components for specific visual requirements.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/intro-react.md#_snippet_12

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View, Image} from 'react-native';

const CatApp = () => {
  return (
    <View>
      <Image
        source={{
          uri: 'https://reactnative.dev/docs/assets/p_cat1.png',
        }}
        style={{width: 200, height: 200}}
      />
      <Text>Hello, I am your cat!</Text>
    </View>
  );
};

export default CatApp;
```

---

TITLE: Starting Metro Bundler - npm
DESCRIPTION: This shell command uses npm to start the Metro bundler. Running `npm start` initiates the Metro HTTP server, which serves the JavaScript bundle to the React Native application on a simulator or device, enabling features like hot reloading.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/_integration-with-existing-apps-kotlin.md#_snippet_16

LANGUAGE: Shell
CODE:

```
npm start
```

---

TITLE: Starting React Native Development Server (npm)
DESCRIPTION: This shell command initiates the Metro bundler, the development server for React Native. Running `npm start` in the root directory of the React Native project builds the `index.bundle` package and serves it, allowing the Android app to load the JavaScript code during development.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/_integration-with-existing-apps-kotlin.md#_snippet_21

LANGUAGE: Shell
CODE:

```
npm start
```

---

TITLE: Performing POST Request with Fetch API in React Native (TSX)
DESCRIPTION: Illustrates how to make a POST request using the Fetch API, including custom headers for content type and a JSON stringified body. This is essential for sending data to a server.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/network.md#_snippet_1

LANGUAGE: tsx
CODE:

```
fetch('https://mywebsite.com/endpoint/', {
  method: 'POST',
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    firstParam: 'yourValue',
    secondParam: 'yourOtherValue',
  }),
});
```

---

TITLE: Configuring TextInput for Forms in React Native (TypeScript)
DESCRIPTION: This React Native component demonstrates how to create a form with two `TextInput` fields (Full Name and Email) and optimize their behavior for improved user experience, with TypeScript type annotations. It uses `useState` for state management, `useRef` for managing input focus, and configures properties like `autoFocus`, `autoCapitalize`, `keyboardType`, `returnKeyType`, and `onSubmitEditing` to guide user input and facilitate form submission. The `submit` function displays an alert with the entered data.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/improvingux.md#_snippet_1

LANGUAGE: typescript
CODE:

```
import React, {useState, useRef} from 'react';
import {
  Alert,
  Text,
  StatusBar,
  TextInput,
  View,
  StyleSheet,
} from 'react-native';

const App = () => {
  const emailInput = useRef<TextInput>(null);
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');

  const submit = () => {
    Alert.alert(
      `Welcome, ${name}! Confirmation email has been sent to ${email}`,
    );
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      <View style={styles.header}>
        <Text style={styles.description}>
          This demo shows how using available TextInput customizations can make
          forms much easier to use. Try completing the form and notice that
          different fields have specific optimizations and the return key
          changes from focusing next input to submitting the form.
        </Text>
      </View>
      <TextInput
        style={styles.input}
        value={name}
        onChangeText={text => setName(text)}
        placeholder="Full Name"
        autoFocus={true}
        autoCapitalize="words"
        autoCorrect={true}
        keyboardType="default"
        returnKeyType="next"
        onSubmitEditing={() => emailInput.current?.focus()}
        blurOnSubmit={false}
      />
      <TextInput
        style={styles.input}
        value={email}
        onChangeText={text => setEmail(text)}
        ref={emailInput}
        placeholder="email@example.com"
        autoCapitalize="none"
        autoCorrect={false}
        keyboardType="email-address"
        returnKeyType="send"
        onSubmitEditing={submit}
        blurOnSubmit={true}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    paddingTop: 64,
    padding: 20,
    backgroundColor: '#282c34',
  },
  description: {
    fontSize: 14,
    color: 'white',
  },
  input: {
    margin: 20,
    marginBottom: 0,
    height: 34,
    paddingHorizontal: 10,
    borderRadius: 4,
    borderColor: '#ccc',
    borderWidth: 1,
    fontSize: 16,
  },
});

export default App;
```

---

TITLE: Displaying UI with React Native Core Components
DESCRIPTION: This snippet demonstrates a basic React Native application that utilizes several Core Components: ScrollView for scrollable content, Text for displaying text, View as a generic container, Image for displaying an image from a URL, and TextInput for user input. It showcases how these fundamental components are combined to build a simple user interface.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/intro-react-native-components.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, Text, Image, ScrollView, TextInput} from 'react-native';

const App = () => {
  return (
    <ScrollView>
      <Text>Some text</Text>
      <View>
        <Text>Some more text</Text>
        <Image
          source={{
            uri: 'https://reactnative.dev/docs/assets/p_cat2.png',
          }}
          style={{width: 200, height: 200}}
        />
      </View>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="You can type in me"
      />
    </ScrollView>
  );
};

export default App;
```

---

TITLE: Updating State with Button Press in React Native
DESCRIPTION: Illustrates how to use the `onPress` prop of a React Native `Button` component to trigger a state update. When the button is pressed, the `setIsHungry` function is called to change the `isHungry` state to `false`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/intro-react.md#_snippet_17

LANGUAGE: typescript
CODE:

```
<Button
  onPress={() => {
    setIsHungry(false);
  }}
  //..
/>
```

---

TITLE: Starting React Native Development Server (npm)
DESCRIPTION: This command starts the Metro bundler, which is the development server for React Native. It bundles the JavaScript code and serves it to the native application, enabling live reloading and debugging during development.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/_integration-with-existing-apps-swift.md#_snippet_13

LANGUAGE: shell
CODE:

```
npm start
```

---

TITLE: Declaring State Variable with useState Hook
DESCRIPTION: This code demonstrates how to declare a state variable (`isHungry`) and its corresponding setter function (`setIsHungry`) using the `useState` Hook inside a functional component. The initial value for `isHungry` is set to `true`, and the destructuring assignment pattern `[getter, setter] = useState(initialValue)` is highlighted.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/intro-react.md#_snippet_16

LANGUAGE: tsx
CODE:

```
const Cat = (props: CatProps) => {
  const [isHungry, setIsHungry] = useState(true);
  // ...
};
```

---

TITLE: Improving Touchable Responsiveness with requestAnimationFrame (TypeScript)
DESCRIPTION: This snippet demonstrates how to wrap an expensive action inside an `onPress` handler with `requestAnimationFrame`. This ensures that UI updates, such as opacity changes, are visible before the `onPress` function completes, preventing visual stuttering caused by the JavaScript thread being blocked. It's particularly useful when `onPress` triggers a `setState` that involves significant work.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/performance.md#_snippet_1

LANGUAGE: tsx
CODE:

```
handleOnPress() {
  requestAnimationFrame(() => {
    this.doExpensiveAction();
  });
}
```

---

TITLE: Implementing TouchableOpacity with State in React Native
DESCRIPTION: This example demonstrates how to use `TouchableOpacity` in a React Native application to create a pressable button that updates a counter. It utilizes `useState` for state management and `StyleSheet` for component styling, showcasing a basic interactive UI element. The `SafeAreaProvider` and `SafeAreaView` ensure content is displayed within safe areas.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/touchableopacity.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React, {useState} from 'react';
import {StyleSheet, Text, TouchableOpacity, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [count, setCount] = useState(0);
  const onPress = () => setCount(prevCount => prevCount + 1);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={styles.countContainer}>
          <Text>Count: {count}</Text>
        </View>
        <TouchableOpacity style={styles.button} onPress={onPress}>
          <Text>Press Here</Text>
        </TouchableOpacity>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 10,
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
  },
  countContainer: {
    alignItems: 'center',
    padding: 10,
  },
});

export default App;
```

---

TITLE: Setting `accessibilityLabel` for Touchable Elements in React Native (TSX)
DESCRIPTION: Illustrates how to set an `accessibilityLabel` on a `TouchableOpacity` to provide a custom string that screen readers like VoiceOver or TalkBack will verbalize when the element is selected. This improves clarity for users of assistive technologies, overriding the default label derived from child text nodes.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/accessibility.md#_snippet_1

LANGUAGE: TypeScript
CODE:

```
<TouchableOpacity
  accessible={true}
  accessibilityLabel="Tap me!"
  onPress={onPress}>
  <View style={styles.button}>
    <Text style={styles.buttonText}>Press me!</Text>
  </View>
</TouchableOpacity>
```

---

TITLE: Registering an Application Component (TSX)
DESCRIPTION: The `registerComponent()` method registers a React Native application component with the `AppRegistry`. It takes an `appKey` (string) to uniquely identify the component, a `getComponentFunc` (ComponentProvider) which is a function that returns the component, and an optional `section` boolean. This is the primary way to make a React Native app runnable by the native system.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/appregistry.md#_snippet_7

LANGUAGE: tsx
CODE:

```
static registerComponent(
  appKey: string,
  getComponentFunc: ComponentProvider,
  section?: boolean,
): string;
```

---

TITLE: Passing Props to Custom Components (JS)
DESCRIPTION: This JavaScript example illustrates how to pass `props` to a custom React component. The `Cat` component receives a `name` prop, which is then used to customize the text rendered for each cat instance in the `Cafe` component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/intro-react.md#_snippet_10

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const Cat = props => {
  return (
    <View>
      <Text>Hello, I am {props.name}!</Text>
    </View>
  );
};

const Cafe = () => {
  return (
    <View>
      <Cat name="Maru" />
      <Cat name="Jellylorum" />
      <Cat name="Spot" />
    </View>
  );
};

export default Cafe;
```

---

TITLE: Implementing Real-time Text Translation with React Native TextInput
DESCRIPTION: This snippet demonstrates how to use React Native's `TextInput` component to capture user input and update the UI in real-time. It utilizes the `useState` hook to manage the input text and dynamically translates it into a sequence of pizza emojis, showcasing the `onChangeText` prop. The component requires `React`, `useState`, `Text`, `TextInput`, and `View` from `react-native`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/handling-text-input.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React, {useState} from 'react';
import {Text, TextInput, View} from 'react-native';

const PizzaTranslator = () => {
  const [text, setText] = useState('');
  return (
    <View style={{padding: 10}}>
      <TextInput
        style={{height: 40, padding: 5}}
        placeholder="Type here to translate!"
        onChangeText={newText => setText(newText)}
        defaultValue={text}
      />
      <Text style={{padding: 10, fontSize: 42}}>
        {text
          .split(' ')
          .map(word => word && '🍕')
          .join(' ')}
      </Text>
    </View>
  );
};

export default PizzaTranslator;
```

---

TITLE: Implementing State with useState Hook in React Native (TypeScript)
DESCRIPTION: This snippet provides a TypeScript version of the `Cat` component, demonstrating state management with `useState` and type definitions for props (`CatProps`). It shows how `isHungry` state changes based on button presses, updating the UI accordingly. The `Cafe` component renders multiple `Cat` instances.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/intro-react.md#_snippet_14

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {Button, Text, View} from 'react-native';

type CatProps = {
  name: string;
};

const Cat = (props: CatProps) => {
  const [isHungry, setIsHungry] = useState(true);

  return (
    <View>
      <Text>
        I am {props.name}, and I am {isHungry ? 'hungry' : 'full'}!
      </Text>
      <Button
        onPress={() => {
          setIsHungry(false);
        }}
        disabled={!isHungry}
        title={isHungry ? 'Give me some food, please!' : 'Thank you!'}
      />
    </View>
  );
};

const Cafe = () => {
  return (
    <>
      <Cat name="Munkustrap" />
      <Cat name="Spot" />
    </>
  );
};

export default Cafe;
```

---

TITLE: Declaring State Variable with useState Hook
DESCRIPTION: Demonstrates how to declare a state variable `isHungry` and its corresponding setter function `setIsHungry` using the `useState` Hook inside a functional component. It initializes `isHungry` to `true`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/intro-react.md#_snippet_16

LANGUAGE: typescript
CODE:

```
const Cat = (props: CatProps) => {
  const [isHungry, setIsHungry] = useState(true);
  // ...
};
```

---

TITLE: Creating a Basic "Hello World" App in React Native
DESCRIPTION: This snippet demonstrates a fundamental "Hello, world!" application in React Native. It uses `Text` and `View` components to display text centered on the screen, illustrating basic component usage and styling with `flex`, `justifyContent`, and `alignItems`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/tutorial.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import { Text, View } from 'react-native';

const HelloWorldApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: "center",
        alignItems: "center"
      }}>
      <Text>Hello, world!</Text>
    </View>
  )
}
export default HelloWorldApp;
```

---

TITLE: Creating a New React Native Project with CLI
DESCRIPTION: This command-line instruction allows developers to initialize a new React Native project using the `@react-native-community/cli`. It specifies the project name as `MyProject` and ensures the latest stable version of React Native is used for the new project setup.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/blog/2024-10-23-release-0.76-new-architecture.md#_snippet_4

LANGUAGE: Shell
CODE:

```
npx @react-native-community/cli@latest init MyProject --version latest
```

---

TITLE: Defining a Functional React Component
DESCRIPTION: This snippet illustrates the basic structure of a functional React component definition. It declares a constant `Cat` that is an arrow function, serving as the blueprint for the component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/intro-react.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
const Cat = () => {};
```

---

TITLE: Creating Custom Components with Props in React Native (JavaScript)
DESCRIPTION: This example illustrates how to define and use custom components that accept `props` in React Native. The `Greeting` component takes a `name` prop to display a personalized message. The `LotsOfGreetings` component then reuses `Greeting` multiple times, passing different `name` values to demonstrate component reusability and customization via props.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/props.md#_snippet_1

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const Greeting = props => {
  return (
    <View style={{alignItems: 'center'}}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={{alignItems: 'center', top: 50}}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Dynamic Flexbox Layout Example in TypeScript
DESCRIPTION: This React Native application, written in TypeScript, demonstrates dynamic manipulation of Flexbox layout properties like `flexDirection`, `justifyContent`, `alignItems`, `direction`, and `flexWrap`. It allows users to interactively change these properties and add/remove colored squares to observe layout changes. Type assertions (`as const`) are used for the arrays of possible property values, enhancing type safety.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/layout-props.md#_snippet_1

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {
  Button,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  View,
} from 'react-native';

const App = () => {
  const flexDirections = [
    'row',
    'row-reverse',
    'column',
    'column-reverse',
  ] as const;
  const justifyContents = [
    'flex-start',
    'flex-end',
    'center',
    'space-between',
    'space-around',
    'space-evenly',
  ] as const;
  const alignItemsArr = [
    'flex-start',
    'flex-end',
    'center',
    'stretch',
    'baseline',
  ] as const;
  const wraps = ['nowrap', 'wrap', 'wrap-reverse'] as const;
  const directions = ['inherit', 'ltr', 'rtl'] as const;
  const [flexDirection, setFlexDirection] = useState(0);
  const [justifyContent, setJustifyContent] = useState(0);
  const [alignItems, setAlignItems] = useState(0);
  const [direction, setDirection] = useState(0);
  const [wrap, setWrap] = useState(0);

  const hookedStyles = {
    flexDirection: flexDirections[flexDirection],
    justifyContent: justifyContents[justifyContent],
    alignItems: alignItemsArr[alignItems],
    direction: directions[direction],
    flexWrap: wraps[wrap],
  };

  const changeSetting = (
    value: number,
    options: readonly unknown[],
    setterFunction: (index: number) => void,
  ) => {
    if (value === options.length - 1) {
      setterFunction(0);
      return;
    }
    setterFunction(value + 1);
  };
  const [squares, setSquares] = useState([<Square />, <Square />, <Square />]);
  return (
    <>
      <View style={{paddingTop: StatusBar.currentHeight}} />
      <View style={[styles.container, styles.playingSpace, hookedStyles]}>
        {squares.map(elem => elem)}
      </View>
      <ScrollView style={styles.container}>
        <View style={styles.controlSpace}>
          <View style={styles.buttonView}>
            <Button
              title="Change Flex Direction"
              onPress={() =>
                changeSetting(flexDirection, flexDirections, setFlexDirection)
              }
            />
            <Text style={styles.text}>{flexDirections[flexDirection]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Justify Content"
              onPress={() =>
                changeSetting(
                  justifyContent,
                  justifyContents,
                  setJustifyContent,
                )
              }
            />
            <Text style={styles.text}>{justifyContents[justifyContent]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Align Items"
              onPress={() =>
                changeSetting(alignItems, alignItemsArr, setAlignItems)
              }
            />
            <Text style={styles.text}>{alignItemsArr[alignItems]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Direction"
              onPress={() => changeSetting(direction, directions, setDirection)}
            />
            <Text style={styles.text}>{directions[direction]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Flex Wrap"
              onPress={() => changeSetting(wrap, wraps, setWrap)}
            />
            <Text style={styles.text}>{wraps[wrap]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Add Square"
              onPress={() => setSquares([...squares, <Square />])}
            />
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Delete Square"
              onPress={() =>
                setSquares(squares.filter((v, i) => i !== squares.length - 1))
              }
            />
          </View>
        </View>
      </ScrollView>
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    height: '50%',
  },
  playingSpace: {
    backgroundColor: 'white',
    borderColor: 'blue',
    borderWidth: 3,
  },
  controlSpace: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    backgroundColor: '#F5F5F5',
  },
  buttonView: {
    width: '50%',
    padding: 10,
  },
  text: {textAlign: 'center'},
});

const Square = () => (
  <View
    style={{
      width: 50,
      height: 50,
      backgroundColor: randomHexColor(),
    }}
  />
);

const randomHexColor = () => {
  return '#000000'.replace(/0/g, () => {
    return Math.round(Math.random() * 16).toString(16);
  });
};

export default App;

```

---

TITLE: Installing Core React Navigation Packages (npm)
DESCRIPTION: Installs the essential `@react-navigation/native` and `@react-navigation/native-stack` packages using npm, which are required to set up navigation in a React Native project.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/navigation.md#_snippet_0

LANGUAGE: shell
CODE:

```
npm install @react-navigation/native @react-navigation/native-stack
```

---

TITLE: Registering a React Native Component (TSX)
DESCRIPTION: The `registerComponent()` method registers a React Native component with `AppRegistry` under a specified `appKey`. It takes a `ComponentProvider` function that returns the component to be rendered, and an optional `section` boolean for categorization. This is the standard way to make a React component available to the native host.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/appregistry.md#_snippet_7

LANGUAGE: tsx
CODE:

```
static registerComponent(
  appKey: string,
  getComponentFunc: ComponentProvider,
  section?: boolean,
): string;
```

---

TITLE: Implementing State with useState Hook in React Native
DESCRIPTION: This snippet demonstrates a complete React Native application using the `useState` Hook to manage the `isHungry` state of `Cat` components. It includes a `Button` to update the state, showcasing how user interaction can modify component data and trigger re-renders. The `Cafe` component renders multiple `Cat` instances.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/intro-react.md#_snippet_13

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {Button, Text, View} from 'react-native';

const Cat = props => {
  const [isHungry, setIsHungry] = useState(true);

  return (
    <View>
      <Text>
        I am {props.name}, and I am {isHungry ? 'hungry' : 'full'}!
      </Text>
      <Button
        onPress={() => {
          setIsHungry(false);
        }}
        disabled={!isHungry}
        title={isHungry ? 'Pour me some milk, please!' : 'Thank you!'}
      />
    </View>
  );
};

const Cafe = () => {
  return (
    <>
      <Cat name="Munkustrap" />
      <Cat name="Spot" />
    </>
  );
};

export default Cafe;
```

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {Button, Text, View} from 'react-native';

type CatProps = {
  name: string;
};

const Cat = (props: CatProps) => {
  const [isHungry, setIsHungry] = useState(true);

  return (
    <View>
      <Text>
        I am {props.name}, and I am {isHungry ? 'hungry' : 'full'}!
      </Text>
      <Button
        onPress={() => {
          setIsHungry(false);
        }}
        disabled={!isHungry}
        title={isHungry ? 'Pour me some milk, please!' : 'Thank you!'}
      />
    </View>
  );
};

const Cafe = () => {
  return (
    <>
      <Cat name="Munkustrap" />
      <Cat name="Spot" />
    </>
  );
};

export default Cafe;
```

---

TITLE: Running React Native App on Android (npm)
DESCRIPTION: This command, executed from the project root, builds and launches the React Native application on the connected Android device or emulator using npm. It's part of the standard development workflow for testing the app.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/running-on-device.md#_snippet_15

LANGUAGE: shell
CODE:

```
npm run android
```

---

TITLE: Demonstrating React Native Core Components
DESCRIPTION: This React Native snippet illustrates the composition of several Core Components, including `ScrollView`, `Text`, `View`, `Image`, and `TextInput`. It creates a simple scrollable UI that displays text, an image, and an interactive text input field, showcasing how these components are used together to build mobile interfaces.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/intro-react-native-components.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, Text, Image, ScrollView, TextInput} from 'react-native';

const App = () => {
  return (
    <ScrollView>
      <Text>Some text</Text>
      <View>
        <Text>Some more text</Text>
        <Image
          source={{
            uri: 'https://reactnative.dev/docs/assets/p_cat2.png',
          }}
          style={{width: 200, height: 200}}
        />
      </View>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="You can type in me"
      />
    </ScrollView>
  );
};

export default App;
```

---

TITLE: Importing useState Hook in React
DESCRIPTION: This snippet shows the standard way to import the `useState` Hook from the 'react' library, which is a prerequisite for using state in functional components.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/intro-react.md#_snippet_15

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
```

---

TITLE: Basic TextInput Usage in React Native
DESCRIPTION: Demonstrates the fundamental use of TextInput for single-line and numeric input. It uses useState to manage text and number values, and onChangeText to update them. Includes basic styling for the input fields.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/textinput.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {SafeAreaView, StyleSheet, TextInput} from 'react-native';

const TextInputExample = () => {
  const [text, onChangeText] = React.useState('Useless Text');
  const [number, onChangeNumber] = React.useState('');

  return (
    <SafeAreaView>
      <TextInput
        style={styles.input}
        onChangeText={onChangeText}
        value={text}
      />
      <TextInput
        style={styles.input}
        onChangeText={onChangeNumber}
        value={number}
        placeholder="useless placeholder"
        keyboardType="numeric"
      />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  input: {
    height: 40,
    margin: 12,
    borderWidth: 1,
    padding: 10,
  },
});

export default TextInputExample;
```

---

TITLE: Using Core Components in React Native
DESCRIPTION: This snippet demonstrates the basic usage of several core React Native components: ScrollView, Text, View, Image, and TextInput. It shows how to compose these components to create a simple UI, including displaying text, an image, and an editable text input field within a scrollable container. This example illustrates the declarative nature of React Native UI development.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/intro-react-native-components.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, Text, Image, ScrollView, TextInput} from 'react-native';

const App = () => {
  return (
    <ScrollView>
      <Text>Some text</Text>
      <View>
        <Text>Some more text</Text>
        <Image
          source={{
            uri: 'https://reactnative.dev/docs/assets/p_cat2.png',
          }}
          style={{width: 200, height: 200}}
        />
      </View>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="You can type in me"
      />
    </ScrollView>
  );
};

export default App;
```

---

TITLE: Initializing a React Native Project for Fabric Components (CLI)
DESCRIPTION: This command initializes a new React Native project named 'Demo' using the `@react-native-community/cli`. The `--install-pods false` flag prevents CocoaPods from being automatically installed, which might be desired for specific setup workflows or manual pod management. This project will serve as the base for integrating the new Fabric Native Component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/fabric-native-components.md#_snippet_0

LANGUAGE: bash
CODE:

```
npx @react-native-community/cli@latest init Demo --install-pods false
```

---

TITLE: Optimizing FlatList renderItem with useCallback in TypeScript
DESCRIPTION: This example shows how to optimize the `renderItem` function for `FlatList` in functional components by wrapping it with `useCallback`. This prevents the function from being recreated on every render, which can improve performance by allowing React to memoize the `FlatList` component itself if its props (including `renderItem`) don't change.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/optimizing-flatlist-configuration.md#_snippet_1

LANGUAGE: TypeScript
CODE:

```
const renderItem = useCallback(({item}) => (
   <View key={item.key}>
      <Text>{item.title}</Text>
   </View>
 ), []);

return (
  // ...

  <FlatList data={items} renderItem={renderItem} />;
  // ...
);
```

---

TITLE: Opening External URL (React Native, TypeScript)
DESCRIPTION: This method attempts to open a given URL using any installed application capable of handling that URL scheme. It returns a Promise that resolves upon successful opening or rejection if no app can handle the URL or the user cancels the action. It's crucial to include the protocol (e.g., "http://", "https://") for web URLs and consider checking `canOpenURL()` for non-http(s) schemes.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/linking.md#_snippet_14

LANGUAGE: TypeScript
CODE:

```
static openURL(url: string): Promise<any>;
```

---

TITLE: Creating a TypeScript Component in React Native
DESCRIPTION: This snippet defines a `Hello` React Native component using TypeScript. It demonstrates props and state management, including incrementing/decrementing an enthusiasm level, and uses native components like `View`, `Text`, and `Button`. Styling is applied via `StyleSheet.create`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/blog/2018-05-07-using-typescript-with-react-native.md#_snippet_11

LANGUAGE: TypeScript
CODE:

```
// components/Hello.tsx
import React from 'react';
import {Button, StyleSheet, Text, View} from 'react-native';

export interface Props {
  name: string;
  enthusiasmLevel?: number;
}

interface State {
  enthusiasmLevel: number;
}

export class Hello extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);

    if ((props.enthusiasmLevel || 0) <= 0) {
      throw new Error(
        'You could be a little more enthusiastic. :D',
      );
    }

    this.state = {
      enthusiasmLevel: props.enthusiasmLevel || 1,
    };
  }

  onIncrement = () =>
    this.setState({
      enthusiasmLevel: this.state.enthusiasmLevel + 1,
    });
  onDecrement = () =>
    this.setState({
      enthusiasmLevel: this.state.enthusiasmLevel - 1,
    });
  getExclamationMarks = (numChars: number) =>
    Array(numChars + 1).join('!');

  render() {
    return (
      <View style={styles.root}>
        <Text style={styles.greeting}>
          Hello{' '}
          {this.props.name +
            this.getExclamationMarks(this.state.enthusiasmLevel)}
        </Text>

        <View style={styles.buttons}>
          <View style={styles.button}>
            <Button
              title="-"
              onPress={this.onDecrement}
              accessibilityLabel="decrement"
              color="red"
            />
          </View>

          <View style={styles.button}>
            <Button
              title="+"
              onPress={this.onIncrement}
              accessibilityLabel="increment"
              color="blue"
            />
          </View>
        </View>
      </View>
    );
  }
}

// styles
const styles = StyleSheet.create({
  root: {
    alignItems: 'center',
    alignSelf: 'center',
  },
  buttons: {
    flexDirection: 'row',
    minHeight: 70,
    alignItems: 'stretch',
    alignSelf: 'center',
    borderWidth: 5,
  },
  button: {
    flex: 1,
    paddingVertical: 0,
  },
  greeting: {
    color: '#999',
    fontWeight: 'bold',
  },
});
```

---

TITLE: Accessing width Property with useWindowDimensions in React Native (tsx)
DESCRIPTION: This snippet shows how to access the `width` property from the `useWindowDimensions` hook. The `width` value represents the width in pixels of the application's window or screen, crucial for responsive design.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/usewindowdimensions.md#_snippet_6

LANGUAGE: tsx
CODE:

```
useWindowDimensions().width;
```

---

TITLE: Monitoring AppState with Functional Component (JavaScript)
DESCRIPTION: This snippet demonstrates how to use the `AppState` module within a React Native functional component. It utilizes `useState` to manage the visible app state and `useEffect` to add and remove an event listener for 'change' events, logging when the app transitions to the foreground.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/appstate.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React, {useRef, useState, useEffect} from 'react';
import {AppState, StyleSheet, Text, View} from 'react-native';

const AppStateExample = () => {
  const appState = useRef(AppState.currentState);
  const [appStateVisible, setAppStateVisible] = useState(appState.current);

  useEffect(() => {
    const subscription = AppState.addEventListener('change', nextAppState => {
      if (
        appState.current.match(/inactive|background/) &&
        nextAppState === 'active'
      ) {
        console.log('App has come to the foreground!');
      }

      appState.current = nextAppState;
      setAppStateVisible(appState.current);
      console.log('AppState', appState.current);
    });

    return () => {
      subscription.remove();
    };
  }, []);

  return (
    <View style={styles.container}>
      <Text>Current state is: {appStateVisible}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default AppStateExample;
```

---

TITLE: Creating a Reusable Header Text Component in React Native
DESCRIPTION: This snippet defines a reusable `MyAppHeaderText` functional component that wraps its children in a `MyAppText` component and applies additional styling (e.g., `fontSize`). This pattern promotes consistent styling and allows for easy customization and overriding of inherited styles.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/text.md#_snippet_6

LANGUAGE: JSX
CODE:

```
const MyAppHeaderText = ({children}) => {
  return (
    <MyAppText>
      <Text style={{fontSize: 20}}>{children}</Text>
    </MyAppText>
  );
};
```

---

TITLE: Displaying an Image with Props in React Native
DESCRIPTION: This snippet demonstrates how to display an image in a React Native component using the `Image` component and its `source` prop. The `source` prop accepts an object with a `uri` property pointing to the image URL. It also shows basic inline styling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/props.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Image} from 'react-native';

const Bananas = () => {
  let pic = {
    uri: 'https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg',
  };
  return (
    <Image source={pic} style={{width: 193, height: 110, marginTop: 50}} />
  );
};

export default Bananas;
```

---

TITLE: Multiline TextInput with Custom Border in React Native
DESCRIPTION: Illustrates how to use a multiline TextInput and apply custom border styles by wrapping it in a View. It also shows how to limit the number of lines and maximum length, and dynamically change the background color based on input.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/textinput.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, TextInput} from 'react-native';

const MultilineTextInputExample = () => {
  const [value, onChangeText] = React.useState('Useless Multiline Placeholder');

  // If you type something in the text box that is a color, the background will change to that
  // color.
  return (
    <View
      style={{
        backgroundColor: value,
        borderBottomColor: '#000000',
        borderBottomWidth: 1,
      }}>
      <TextInput
        editable
        multiline
        numberOfLines={4}
        maxLength={40}
        onChangeText={text => onChangeText(text)}
        value={value}
        style={{padding: 10}}
      />
    </View>
  );
};

export default MultilineTextInputExample;
```

---

TITLE: Creating a New Expo Project (Shell)
DESCRIPTION: This command initializes a new React Native project using the Expo Framework. It leverages `npx` to execute the `create-expo-app` package, setting up a production-ready application with Expo's developer tooling and standard libraries. This is the first step to begin developing a new React Native application with Expo.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/getting-started.md#_snippet_0

LANGUAGE: shell
CODE:

```
npx create-expo-app@latest
```

---

TITLE: Writing Unit Test with Jest (JavaScript)
DESCRIPTION: This snippet demonstrates a basic unit test using Jest's `it` function. It follows the Given-When-Then (AAA) structure to test a function `colorForDueDate` for a specific input and expected output. It ensures the function returns 'red' when given a past date.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/testing-overview.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
it('given a date in the past, colorForDueDate() returns red', () => {
  expect(colorForDueDate('2000-10-20')).toBe('red');
});
```

---

TITLE: Complete Fetch Data Display Example in React Native (JS)
DESCRIPTION: This comprehensive JavaScript example demonstrates fetching data from an API, managing loading states with 'useState', and displaying the results in a 'FlatList'. It uses 'useEffect' to initiate the fetch operation on component mount and includes error handling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/network.md#_snippet_4

LANGUAGE: javascript
CODE:

```
import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View} from 'react-native';

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState([]);

  const getMovies = async () => {
    try {
      const response = await fetch('https://reactnative.dev/movies.json');
      const json = await response.json();
      setData(json.movies);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getMovies();
  }, []);

  return (
    <View style={{flex: 1, padding: 24}}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <Text>
              {item.title}, {item.releaseYear}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
```

---

TITLE: Implementing State with useState in React Native (TypeScript)
DESCRIPTION: Illustrates the use of the `useState` Hook in a React Native functional component with TypeScript, including type definitions for props. It manages a cat's hunger state, updating it via a button press and demonstrating component re-rendering.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/intro-react.md#_snippet_14

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {Button, Text, View} from 'react-native';

type CatProps = {
  name: string;
};

const Cat = (props: CatProps) => {
  const [isHungry, setIsHungry] = useState(true);

  return (
    <View>
      <Text>
        I am {props.name}, and I am {isHungry ? 'hungry' : 'full'}!
      </Text>
      <Button
        onPress={() => {
          setIsHungry(false);
        }}
        disabled={!isHungry}
        title={isHungry ? 'Give me some food, please!' : 'Thank you!'}
      />
    </View>
  );
};

const Cafe = () => {
  return (
    <>
      <Cat name="Munkustrap" />
      <Cat name="Spot" />
    </>
  );
};

export default Cafe;
```

---

TITLE: Styling React Native View Components with Flexbox and Borders
DESCRIPTION: This example demonstrates how to style `View` components in React Native using `StyleSheet.create` to define various visual properties. It showcases the use of flexbox for layout (`flex`, `justifyContent`), background colors, border widths, and border radii to create a visually distinct three-section layout. The `View` component acts as a container for other styled `View` elements.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/view-style-props.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, StyleSheet} from 'react-native';

const ViewStyleProps = () => {
  return (
    <View style={styles.container}>
      <View style={styles.top} />
      <View style={styles.middle} />
      <View style={styles.bottom} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-between',
    backgroundColor: '#fff',
    padding: 20,
    margin: 10,
  },
  top: {
    flex: 0.3,
    backgroundColor: 'grey',
    borderWidth: 5,
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
  },
  middle: {
    flex: 0.3,
    backgroundColor: 'beige',
    borderWidth: 5,
  },
  bottom: {
    flex: 0.3,
    backgroundColor: 'pink',
    borderWidth: 5,
    borderBottomLeftRadius: 20,
    borderBottomRightRadius: 20,
  },
});

export default ViewStyleProps;
```

---

TITLE: Correct Text Node Placement in React Native
DESCRIPTION: This snippet demonstrates the correct and required way to include text within a React Native component. All text content must be wrapped inside a `<Text>` component, even when placed within a `<View>`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/text.md#_snippet_7

LANGUAGE: TSX
CODE:

```
// GOOD
<View>
  <Text>
    Some text
  </Text>
</View>
```

---

TITLE: Installing Node and Watchman with Homebrew
DESCRIPTION: This command installs Node.js and Watchman using Homebrew, a package manager for macOS. Node.js is essential for running JavaScript, and Watchman, a file watcher by Facebook, is highly recommended for improved performance during development.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/_getting-started-macos-ios.md#_snippet_0

LANGUAGE: shell
CODE:

```
brew install node
brew install watchman
```

---

TITLE: Implementing a React Native Grocery Shopping List Component (TypeScript)
DESCRIPTION: This React Native functional component demonstrates state management using useState for a grocery item input and a list of items. It includes a TextInput for user input, a Button to add items, and displays the list of added items. The addNewItemToShoppingList callback ensures efficient state updates.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/testing-overview.md#_snippet_1

LANGUAGE: TypeScript
CODE:

```
function GroceryShoppingList() {
  const [groceryItem, setGroceryItem] = useState('');
  const [items, setItems] = useState<string[]>([]);

  const addNewItemToShoppingList = useCallback(() => {
    setItems([groceryItem, ...items]);
    setGroceryItem('');
  }, [groceryItem, items]);

  return (
    <>
      <TextInput
        value={groceryItem}
        placeholder="Enter grocery item"
        onChangeText={text => setGroceryItem(text)}
      />
      <Button
        title="Add the item to list"
        onPress={addNewItemToShoppingList}
      />
      {items.map(item => (
        <Text key={item}>{item}</Text>
      ))}
    </>
  );
}
```

---

TITLE: Making a POST Request with Custom Headers and Body using Fetch in React Native
DESCRIPTION: This snippet shows how to make a POST request using Fetch, including custom headers for 'Accept' and 'Content-Type', and a JSON stringified body. It allows for sending data to an endpoint.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/network.md#_snippet_1

LANGUAGE: tsx
CODE:

```
fetch('https://mywebsite.com/endpoint/', {
  method: 'POST',
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    firstParam: 'yourValue',
    secondParam: 'yourOtherValue'
  })
});
```

---

TITLE: Handling Keyboard Visibility with KeyboardAvoidingView in JavaScript
DESCRIPTION: This snippet demonstrates how to use the `KeyboardAvoidingView` component in React Native to automatically adjust the position of UI elements, such as a `TextInput` and a `Button`, to prevent them from being covered by the software keyboard. It utilizes the `behavior="padding"` prop to add padding when the keyboard appears, ensuring the interactive elements remain visible and accessible. The example includes state management for the input field and a submit action.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/improvingux.md#_snippet_2

LANGUAGE: javascript
CODE:

```
import React, {useState, useRef} from 'react';
import {
  Alert,
  Text,
  Button,
  StatusBar,
  TextInput,
  KeyboardAvoidingView,
  View,
  StyleSheet,
} from 'react-native';

const App = () => {
  const emailInput = useRef(null);
  const [email, setEmail] = useState('');

  const submit = () => {
    emailInput.current.blur();
    Alert.alert(`Confirmation email has been sent to ${email}`);
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      <View style={styles.header}>
        <Text style={styles.description}>
          This demo shows how to avoid covering important UI elements with the
          software keyboard. Focus the email input below and notice that the
          Sign Up button and the text adjusted positions to make sure they are
          not hidden under the keyboard.
        </Text>
      </View>
      <KeyboardAvoidingView behavior="padding" style={styles.form}>
        <TextInput
          style={styles.input}
          value={email}
          onChangeText={text => setEmail(text)}
          ref={emailInput}
          placeholder="email@example.com"
          autoCapitalize="none"
          autoCorrect={false}
          keyboardType="email-address"
          returnKeyType="send"
          onSubmitEditing={submit}
          blurOnSubmit={true}
        />
        <View>
          <Button title="Sign Up" onPress={submit} />
          <Text style={styles.legal}>Some important legal fine print here</Text>
        </View>
      </KeyboardAvoidingView>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    paddingTop: 64,
    padding: 20,
    backgroundColor: '#282c34',
  },
  description: {
    fontSize: 14,
    color: 'white',
  },
  input: {
    margin: 20,
    marginBottom: 0,
    height: 34,
    paddingHorizontal: 10,
    borderRadius: 4,
    borderColor: '#ccc',
    borderWidth: 1,
    fontSize: 16,
  },
  legal: {
    margin: 10,
    color: '#333',
    fontSize: 12,
    textAlign: 'center',
  },
  form: {
    flex: 1,
    justifyContent: 'space-between',
  },
});

export default App;
```

---

TITLE: Applying Text Styling Properties in React Native
DESCRIPTION: This React Native example demonstrates the application of various `TextStyle` properties to a `Text` component. It uses React Hooks (`useState`) to manage dynamic styling, including font size, style, weight, line height, text alignment, decoration, transformation, and shadow. The example also includes platform-specific styling for Android (e.g., `includeFontPadding`, `textAlignVertical`) and iOS (e.g., `textDecorationStyle`, `writingDirection`), and custom reusable components for UI controls.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/text-style-props.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {
  FlatList,
  Platform,
  ScrollView,
  StyleSheet,
  Switch,
  Text,
  TouchableWithoutFeedback,
  View,
} from 'react-native';
import Slider from '@react-native-community/slider';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const fontStyles = ['normal', 'italic'];
const fontVariants = [
  undefined,
  'small-caps',
  'oldstyle-nums',
  'lining-nums',
  'tabular-nums',
  'proportional-nums',
];
const fontWeights = [
  'normal',
  'bold',
  '100',
  '200',
  '300',
  '400',
  '500',
  '600',
  '700',
  '800',
  '900',
];
const textAlignments = ['auto', 'left', 'right', 'center', 'justify'];
const textDecorationLines = [
  'none',
  'underline',
  'line-through',
  'underline line-through',
];
const textDecorationStyles = ['solid', 'double', 'dotted', 'dashed'];
const textTransformations = ['none', 'uppercase', 'lowercase', 'capitalize'];
const textAlignmentsVertical = ['auto', 'top', 'bottom', 'center'];
const writingDirections = ['auto', 'ltr', 'rtl'];

const App = () => {
  const [fontSize, setFontSize] = useState(20);
  const [fontStyleIdx, setFontStyleIdx] = useState(0);
  const [fontWeightIdx, setFontWeightIdx] = useState(0);
  const [lineHeight, setLineHeight] = useState(24);
  const [textAlignIdx, setTextAlignIdx] = useState(0);
  const [textDecorationLineIdx, setTextDecorationLineIdx] = useState(0);
  const [includeFontPadding, setIncludeFontPadding] = useState(false);
  const [textVerticalAlignIdx, setTextVerticalAlignIdx] = useState(0);
  const [fontVariantIdx, setFontVariantIdx] = useState(0);
  const [letterSpacing, setLetterSpacing] = useState(0);
  const [textDecorationStyleIdx, setTextDecorationStyleIdx] = useState(0);
  const [textTransformIdx, setTextTransformIdx] = useState(0);
  const [writingDirectionIdx, setWritingDirectionIdx] = useState(0);
  const [textShadowRadius, setTextShadowRadius] = useState(0);
  const [textShadowOffset, setTextShadowOffset] = useState({
    height: 0,
    width: 0,
  });

  const [, ...validFontVariants] = fontVariants;

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={styles.pargraphWrapper}>
          <Text
            style={[
              styles.paragraph,
              {
                fontSize,
                fontStyle: fontStyles[fontStyleIdx],
                fontWeight: fontWeights[fontWeightIdx],
                lineHeight,
                textAlign: textAlignments[textAlignIdx],
                textDecorationLine: textDecorationLines[textDecorationLineIdx],
                textTransform: textTransformations[textTransformIdx],
                textAlignVertical: textAlignmentsVertical[textVerticalAlignIdx],
                fontVariant:
                  fontVariantIdx === 0
                    ? undefined
                    : [validFontVariants[fontVariantIdx - 1]],
                letterSpacing,
                includeFontPadding,
                textDecorationStyle:
                  textDecorationStyles[textDecorationStyleIdx],
                writingDirection: writingDirections[writingDirectionIdx],
                textShadowOffset,
                textShadowRadius,
              },
            ]}>
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry. 112 Likes
          </Text>
        </View>
        <ScrollView style={{padding: 12}}>
          <View>
            <Text>Common platform properties</Text>
            <CustomSlider
              label="Text Shadow Offset - Height"
              value={textShadowOffset.height}
              minimumValue={-40}
              maximumValue={40}
              handleValueChange={val =>
                setTextShadowOffset(prev => ({...prev, height: val}))
              }
            />
            <CustomSlider
              label="Text Shadow Offset - Width"
              value={textShadowOffset.width}
              minimumValue={-40}
              maximumValue={40}
              handleValueChange={val =>
                setTextShadowOffset(prev => ({...prev, width: val}))
              }
            />
            <CustomSlider
              label="Font Size"
              value={fontSize}
              maximumValue={40}
              handleValueChange={setFontSize}
            />
            <CustomPicker
              label="Font Style"
              data={fontStyles}
              currentIndex={fontStyleIdx}
              onSelected={setFontStyleIdx}
            />
            <CustomPicker
              label="Font Weight"
              data={fontWeights}
              currentIndex={fontWeightIdx}
              onSelected={setFontWeightIdx}
            />
            <CustomSlider
              label="Line Height"
              value={lineHeight}
              minimumValue={10}
              maximumValue={50}
              handleValueChange={setLineHeight}
            />
            <CustomPicker
              label="Text Align"
              data={textAlignments}
              currentIndex={textAlignIdx}
              onSelected={setTextAlignIdx}
            />
            <CustomPicker
              label="Text Decoration Line"
              data={textDecorationLines}
              currentIndex={textDecorationLineIdx}
              onSelected={setTextDecorationLineIdx}
            />
            <CustomSlider
              label="Text Shadow Radius"
              value={textShadowRadius}
              handleValueChange={setTextShadowRadius}
            />
            <CustomPicker
              label="Font Variant"
              data={fontVariants}
              currentIndex={fontVariantIdx}
              onSelected={setFontVariantIdx}
            />
            <CustomSlider
              label="Letter Spacing"
              step={0.1}
              value={letterSpacing}
              handleValueChange={setLetterSpacing}
            />
            <CustomPicker
              label="Text Transform"
              data={textTransformations}
              currentIndex={textTransformIdx}
              onSelected={setTextTransformIdx}
            />
          </View>
          {Platform.OS === 'android' && (
            <View style={styles.platformContainer}>
              <Text style={styles.platformContainerTitle}>
                Android only properties
              </Text>
              <CustomPicker
                label="Text Vertical Align"
                data={textAlignmentsVertical}
                currentIndex={textVerticalAlignIdx}
                onSelected={setTextVerticalAlignIdx}
              />
              <CustomSwitch
                label="Include Font Padding"
                handleValueChange={setIncludeFontPadding}
                value={includeFontPadding}
              />
            </View>
          )}
          {Platform.OS === 'ios' && (
            <View style={styles.platformContainer}>
              <Text style={styles.platformContainerTitle}>
                iOS only properties
              </Text>
              <CustomPicker
                label="Text Decoration Style"
                data={textDecorationStyles}
                currentIndex={textDecorationStyleIdx}
                onSelected={setTextDecorationStyleIdx}
              />
              <CustomPicker
                label="Writing Direction"
                data={writingDirections}
                currentIndex={writingDirectionIdx}
                onSelected={setWritingDirectionIdx}
              />
            </View>
          )}
        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const CustomSwitch = ({label, handleValueChange, value}) => {
  return (
    <>
      <Text style={styles.title}>{label}</Text>
      <View style={{alignItems: 'flex-start'}}>
        <Switch
          trackColor={{false: '#767577', true: '#DAA520'}}
          thumbColor={value ? '#DAA520' : '#f4f3f4'}
          onValueChange={handleValueChange}
          value={value}
        />
      </View>
    </>
  );
};

const CustomSlider = ({
  label,
  handleValueChange,
  step = 1,
  minimumValue = 0,
  maximumValue = 10,
  value,
}) => {
  return (
    <>
      {label && (
        <Text style={styles.title}>{`${label} (${value.toFixed(2)})`}</Text>
      )}
      <View style={styles.wrapperHorizontal}>
        <Slider
          thumbTintColor="#06bcee"
          minimumTrackTintColor="#64d7ffbb"
          minimumValue={minimumValue}
          maximumValue={maximumValue}
          step={step}
          onValueChange={handleValueChange}
          value={value}
        />
      </View>
    </>
  );
};

const CustomPicker = ({label, data, currentIndex, onSelected}) => {
  return (
    <>
      <Text style={styles.title}>{label}</Text>
      <View style={styles.wrapperHorizontal}>
        <FlatList
          bounces
          horizontal
          data={data}
          keyExtractor={item => String(item)}
          renderItem={({item, index}) => {
            const selected = index === currentIndex;
            return (
              <TouchableWithoutFeedback onPress={() => onSelected(index)}>
                <View
                  style={[
                    styles.itemStyleHorizontal,
                    selected && styles.itemSelectedStyleHorizontal,
                  ]}>
                  <Text
                    style={{
                      textAlign: 'center',
                      color: selected ? 'black' : 'grey',
                      fontWeight: selected ? 'bold' : 'normal',
                    }}>
```

---

TITLE: Creating a React Native Project with Specific Version
DESCRIPTION: This command allows developers to create a new React Native project ('AwesomeProject') using a specific version of the React Native framework by passing the '--version' argument to the `npx react-native init` command.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/_getting-started-windows-android.md#_snippet_5

LANGUAGE: shell
CODE:

```
npx react-native@X.XX.X init AwesomeProject --version X.XX.X
```

---

TITLE: Demonstrating Core Components in React Native
DESCRIPTION: This snippet showcases the basic usage of several core React Native components: ScrollView, Text, View, Image, and TextInput. It demonstrates how to compose these components to create a simple UI, including displaying text, an image, and an editable text input field within a scrollable container. It highlights the declarative nature of React Native UI development.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/intro-react-native-components.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, Text, Image, ScrollView, TextInput} from 'react-native';

const App = () => {
  return (
    <ScrollView>
      <Text>Some text</Text>
      <View>
        <Text>Some more text</Text>
        <Image
          source={{
            uri: 'https://reactnative.dev/docs/assets/p_cat2.png',
          }}
          style={{width: 200, height: 200}}
        />
      </View>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="You can type in me"
      />
    </ScrollView>
  );
};

export default App;
```

---

TITLE: Starting Metro Bundler with npm (Shell)
DESCRIPTION: This shell command initiates the Metro bundler using npm. Running `npm start` in the project's root directory starts the HTTP server, which shares the JavaScript bundle from `localhost` to a simulator or device, enabling hot reloading.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/_integration-with-existing-apps-kotlin.md#_snippet_17

LANGUAGE: Shell
CODE:

```
npm start
```

---

TITLE: Applying Text Style Properties in React Native (JavaScript)
DESCRIPTION: This comprehensive React Native example demonstrates how to dynamically apply and control a wide range of text styling properties such as fontSize, fontStyle, fontWeight, lineHeight, textAlign, textDecorationLine, textTransform, letterSpacing, textShadowOffset, and textShadowRadius. It also showcases platform-specific properties like textAlignVertical and includeFontPadding for Android, and textDecorationStyle and writingDirection for iOS, using interactive UI controls like sliders, switches, and custom pickers.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/text-style-props.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {
  FlatList,
  Platform,
  ScrollView,
  StatusBar,
  StyleSheet,
  Switch,
  Text,
  TouchableWithoutFeedback,
  View,
} from 'react-native';
import Slider from '@react-native-community/slider';

const fontStyles = ['normal', 'italic'];
const fontVariants = [
  undefined,
  'small-caps',
  'oldstyle-nums',
  'lining-nums',
  'tabular-nums',
  'proportional-nums',
];
const fontWeights = [
  'normal',
  'bold',
  '100',
  '200',
  '300',
  '400',
  '500',
  '600',
  '700',
  '800',
  '900',
];
const textAlignments = ['auto', 'left', 'right', 'center', 'justify'];
const textDecorationLines = [
  'none',
  'underline',
  'line-through',
  'underline line-through',
];
const textDecorationStyles = ['solid', 'double', 'dotted', 'dashed'];
const textTransformations = ['none', 'uppercase', 'lowercase', 'capitalize'];
const textAlignmentsVertical = ['auto', 'top', 'bottom', 'center'];
const writingDirections = ['auto', 'ltr', 'rtl'];

const App = () => {
  const [fontSize, setFontSize] = useState(10);
  const [fontStyleIdx, setFontStyleIdx] = useState(0);
  const [fontWeightIdx, setFontWeightIdx] = useState(0);
  const [lineHeight, setLineHeight] = useState(10);
  const [textAlignIdx, setTextAlignIdx] = useState(0);
  const [textDecorationLineIdx, setTextDecorationLineIdx] = useState(0);
  const [includeFontPadding, setIncludeFontPadding] = useState(false);
  const [textVerticalAlignIdx, setTextVerticalAlignIdx] = useState(0);
  const [fontVariantIdx, setFontVariantIdx] = useState(0);
  const [letterSpacing, setLetterSpacing] = useState(0);
  const [textDecorationStyleIdx, setTextDecorationStyleIdx] = useState(0);
  const [textTransformIdx, setTextTransformIdx] = useState(0);
  const [writingDirectionIdx, setWritingDirectionIdx] = useState(0);
  const [textShadowRadius, setTextShadowRadius] = useState(0);
  const [textShadowOffset, setTextShadowOffset] = useState({
    height: 0,
    width: 0,
  });

  const [, ...validFontVariants] = fontVariants;

  return (
    <View style={styles.container}>
      <Text
        style={[
          styles.paragraph,
          {
            fontSize,
            fontStyle: fontStyles[fontStyleIdx],
            fontWeight: fontWeights[fontWeightIdx],
            lineHeight,
            textAlign: textAlignments[textAlignIdx],
            textDecorationLine: textDecorationLines[textDecorationLineIdx],
            textTransform: textTransformations[textTransformIdx],
            textAlignVertical: textAlignmentsVertical[textVerticalAlignIdx],
            fontVariant:
              fontVariantIdx === 0
                ? undefined
                : [validFontVariants[fontVariantIdx - 1]],
            letterSpacing,
            includeFontPadding,
            textDecorationStyle: textDecorationStyles[textDecorationStyleIdx],
            writingDirection: writingDirections[writingDirectionIdx],
            textShadowOffset,
            textShadowRadius,
          },
        ]}>
        Lorem Ipsum is simply dummy text of the printing and typesetting
        industry. 112 Likes
      </Text>
      <ScrollView>
        <View>
          <Text>Common platform properties</Text>
          <CustomSlider
            label="Text Shadow Offset - Height"
            value={textShadowOffset.height}
            minimumValue={-40}
            maximumValue={40}
            handleValueChange={val =>
              setTextShadowOffset(prev => ({...prev, height: val}))
            }
          />
          <CustomSlider
            label="Text Shadow Offset - Width"
            value={textShadowOffset.width}
            minimumValue={-40}
            maximumValue={40}
            handleValueChange={val =>
              setTextShadowOffset(prev => ({...prev, width: val}))
            }
          />
          <CustomSlider
            label="Font Size"
            value={fontSize}
            maximumValue={40}
            handleValueChange={setFontSize}
          />
          <CustomPicker
            label="Font Style"
            data={fontStyles}
            currentIndex={fontStyleIdx}
            onSelected={setFontStyleIdx}
          />
          <CustomPicker
            label="Font Weight"
            data={fontWeights}
            currentIndex={fontWeightIdx}
            onSelected={setFontWeightIdx}
          />
          <CustomSlider
            label="Line Height"
            value={lineHeight}
            minimumValue={10}
            maximumValue={50}
            handleValueChange={setLineHeight}
          />
          <CustomPicker
            label="Text Align"
            data={textAlignments}
            currentIndex={textAlignIdx}
            onSelected={setTextAlignIdx}
          />
          <CustomPicker
            label="Text Decoration Line"
            data={textDecorationLines}
            currentIndex={textDecorationLineIdx}
            onSelected={setTextDecorationLineIdx}
          />
          <CustomSlider
            label="Text Shadow Radius"
            value={textShadowRadius}
            handleValueChange={setTextShadowRadius}
          />
          <CustomPicker
            label="Font Variant"
            data={fontVariants}
            currentIndex={fontVariantIdx}
            onSelected={setFontVariantIdx}
          />
          <CustomSlider
            label="Letter Spacing"
            step={0.1}
            value={letterSpacing}
            handleValueChange={setLetterSpacing}
          />
          <CustomPicker
            label="Text Transform"
            data={textTransformations}
            currentIndex={textTransformIdx}
            onSelected={setTextTransformIdx}
          />
        </View>
        {Platform.OS === 'android' && (
          <View style={styles.platformContainer}>
            <Text style={styles.platformContainerTitle}>
              Android only properties
            </Text>
            <CustomPicker
              label="Text Vertical Align"
              data={textAlignmentsVertical}
              currentIndex={textVerticalAlignIdx}
              onSelected={setTextVerticalAlignIdx}
            />
            <CustomSwitch
              label="Include Font Padding"
              handleValueChange={setIncludeFontPadding}
              value={includeFontPadding}
            />
          </View>
        )}
        {Platform.OS === 'ios' && (
          <View style={styles.platformContainer}>
            <Text style={styles.platformContainerTitle}>
              iOS only properties
            </Text>
            <CustomPicker
              label="Text Decoration Style"
              data={textDecorationStyles}
              currentIndex={textDecorationStyleIdx}
              onSelected={setTextDecorationStyleIdx}
            />
            <CustomPicker
              label="Writing Direction"
              data={writingDirections}
              currentIndex={writingDirectionIdx}
              onSelected={setWritingDirectionIdx}
            />
          </View>
        )}
      </ScrollView>
    </View>
  );
};

const CustomSwitch = ({label, handleValueChange, value}) => {
  return (
    <>
      <Text style={styles.title}>{label}</Text>
      <View style={{alignItems: 'flex-start'}}>
        <Switch
          trackColor={{false: '#767577', true: '#DAA520'}}
          thumbColor={value ? '#DAA520' : '#f4f3f4'}
          onValueChange={handleValueChange}
          value={value}
        />
      </View>
    </>
  );
};

const CustomSlider = ({
  label,
  handleValueChange,
  step = 1,
  minimumValue = 0,
  maximumValue = 10,
  value,
}) => {
  return (
    <>
      {label && (
        <Text style={styles.title}>{`${label} (${value.toFixed(2)})`}</Text>
      )}
      <View style={styles.wrapperHorizontal}>
        <Slider
          thumbTintColor="#DAA520"
          minimumTrackTintColor="#DAA520"
          minimumValue={minimumValue}
          maximumValue={maximumValue}
          step={step}
          onValueChange={handleValueChange}
          value={value}
        />
      </View>
    </>
  );
};

const CustomPicker = ({label, data, currentIndex, onSelected}) => {
  return (
    <>
      <Text style={styles.title}>{label}</Text>
      <View style={styles.wrapperHorizontal}>
        <FlatList
          bounces
          horizontal
          data={data}
          keyExtractor={item => String(item)}
          renderItem={({item, index}) => {
            const selected = index === currentIndex;
            return (
              <TouchableWithoutFeedback onPress={() => onSelected(index)}>
                <View
                  style={[
                    styles.itemStyleHorizontal,
                    selected && styles.itemSelectedStyleHorizontal,
                  ]}>
                  <Text
                    style={{
                      textAlign: 'center',
                      color: selected ? 'black' : 'grey',
                      fontWeight: selected ? 'bold' : 'normal',
                    }}>
                    {item + ''}
                  </Text>
                </View>
              </TouchableWithoutFeedback>
            );
          }}
        />
      </View>
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: StatusBar.currentHeight,
    backgroundColor: '#ecf0f1',
    padding: 8,
  },
  paragraph: {
    color: 'black',
    textDecorationColor: 'yellow',
    textShadowColor: 'red',
    textShadowRadius: 1,
    margin: 24,
  },
  wrapperHorizontal: {
    height: 54,
    justifyContent: 'center',
    color: 'black',
    marginBottom: 12,
  },
  platformContainer: {
    marginTop: 12,
    borderTopWidth: 1,
    borderTopColor: '#eee',
    paddingTop: 10
  },
  platformContainerTitle: {
    fontWeight: 'bold',
    marginBottom: 10,
    color: 'black'
  },
  itemStyleHorizontal: {
    alignItems: 'center',
    justifyContent: 'center',
    height: 30,
    paddingHorizontal: 10,
    borderRadius: 5,
    borderWidth: 1,
    borderColor: '#ccc',
    marginRight: 8,
  },
  itemSelectedStyleHorizontal: {
    borderColor: '#DAA520',
    backgroundColor: '#DAA52033',
  },
});
```

---

TITLE: Extracting Unique Key for List Items in React Native (TSX)
DESCRIPTION: This function prop is used to generate a unique key for each item in the list, which is crucial for React's reconciliation process, especially for tracking item re-ordering and caching. The default implementation attempts to use `item.key`, then `item.id`, before falling back to the item's `index`. It takes the `item` and its `index` as input and must return a `string`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/virtualizedlist.md#_snippet_2

LANGUAGE: tsx
CODE:

```
(item: any, index: number) => string;
```

---

TITLE: Demonstrating Justify Content in React Native (TypeScript)
DESCRIPTION: This React Native example, written in TypeScript, illustrates how to apply the `justifyContent` style property for aligning child components within a container. It leverages `useState` and type definitions (`PropsWithChildren`) to manage and display various `justifyContent` values such as `flex-start`, `flex-end`, `center`, `space-between`, `space-around`, and `space-evenly`. The `PreviewLayout` component provides a structured way to interact with and visualize these alignment options.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/flexbox.md#_snippet_6

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';
import type {PropsWithChildren} from 'react';

const JustifyContentBasics = () => {
  const [justifyContent, setJustifyContent] = useState('flex-start');

  return (
    <PreviewLayout
      label="justifyContent"
      selectedValue={justifyContent}
      values={[
        'flex-start',
        'flex-end',
        'center',
        'space-between',
        'space-around',
        'space-evenly',
      ]}
      setSelectedValue={setJustifyContent}>
      <View style={[styles.box, {backgroundColor: 'powderblue'}]} />
      <View style={[styles.box, {backgroundColor: 'skyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'steelblue'}]} />
    </PreviewLayout>
  );
};

type PreviewLayoutProps = PropsWithChildren<{
  label: string;
  values: string[];
  selectedValue: string;
  setSelectedValue: (value: string) => void;
}>;

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}: PreviewLayoutProps) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default JustifyContentBasics;
```

---

TITLE: Align Items Layout Example - TypeScript
DESCRIPTION: This React Native component, written in TypeScript, showcases the `alignItems` layout property. It uses an interactive `PreviewLayout` where users can dynamically change `alignItems` values (`stretch`, `flex-start`, `flex-end`, `center`, `baseline`) to see their effect on child component alignment. Type definitions are included for `PreviewLayoutProps` to ensure type safety and improve code maintainability.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/flexbox.md#_snippet_8

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';
import type {PropsWithChildren} from 'react';

const AlignItemsLayout = () => {
  const [alignItems, setAlignItems] = useState('stretch');

  return (
    <PreviewLayout
      label="alignItems"
      selectedValue={alignItems}
      values={['stretch', 'flex-start', 'flex-end', 'center', 'baseline']}
      setSelectedValue={setAlignItems}>
      <View style={[styles.box, {backgroundColor: 'powderblue'}]} />
      <View style={[styles.box, {backgroundColor: 'skyblue'}]} />
      <View
        style={[
          styles.box,
          {
            backgroundColor: 'steelblue',
            width: 'auto',
            minWidth: 50,
          },
        ]}
      />
    </PreviewLayout>
  );
};

type PreviewLayoutProps = PropsWithChildren<{
  label: string;
  values: string[];
  selectedValue: string;
  setSelectedValue: (value: string) => void;
}>;

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}: PreviewLayoutProps) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
    minHeight: 200,
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default AlignItemsLayout;
```

---

TITLE: Memoizing FlatList Item Component with React.memo() in TypeScript
DESCRIPTION: This snippet demonstrates how to use `React.memo()` to optimize a `FlatList` item component. By wrapping `MyListItem` with `memo` and providing a custom comparison function, the component will only re-render when its `title` prop changes, preventing unnecessary re-renders and improving performance.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/optimizing-flatlist-configuration.md#_snippet_0

LANGUAGE: tsx
CODE:

```
import React, {memo} from 'react';
import {View, Text} from 'react-native';

const MyListItem = memo(
  ({title}: {title: string}) => (
    <View>
      <Text>{title}</Text>
    </View>
  ),
  (prevProps, nextProps) => {
    return prevProps.title === nextProps.title;
  },
);

export default MyListItem;
```

---

TITLE: Implementing a Counter with useState Hook in ReactJS
DESCRIPTION: This snippet demonstrates state management in a ReactJS web application using the `useState` hook. It creates a simple counter that increments on button click, showcasing how to declare and update state variables in functional components. It also includes basic CSS for layout.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/tutorial.md#_snippet_2

LANGUAGE: JavaScript
CODE:

```
// ReactJS Counter Example using Hooks!

import React, { useState } from 'react';



const App = () => {
  const [count, setCount] = useState(0);

  return (
    <div className="container">
      <p>You clicked {count} times</p>
      <button
        onClick={() => setCount(count + 1)}>
        Click me!
      </button>
    </div>
  );
};
```

LANGUAGE: CSS
CODE:

```
// CSS
.container {
  display: flex;
  justify-content: center;
  align-items: center;
}
```

---

TITLE: Creating a Row Layout with View and Text in React Native
DESCRIPTION: This snippet demonstrates how to use the `View` component in React Native to create a horizontal layout. It wraps two colored `View` components and a `Text` component within a `SafeAreaView` to ensure content is displayed within safe screen boundaries. The `flexDirection: 'row'` style arranges the children horizontally, and `flex` properties control their proportional width.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/view.md#_snippet_0

LANGUAGE: React Native
CODE:

```
import React from 'react';
import {View, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const ViewBoxesWithColorAndText = () => {
  return (
    <SafeAreaProvider>
      <SafeAreaView style={{height: 100, flexDirection: 'row'}}>
        <View style={{backgroundColor: 'blue', flex: 0.2}} />
        <View style={{backgroundColor: 'red', flex: 0.4}} />
        <Text>Hello World!</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

export default ViewBoxesWithColorAndText;
```

---

TITLE: Example React Native Component with TypeScript
DESCRIPTION: Demonstrates a functional React Native component written in TypeScript, showcasing prop typing (`Props`), state management with `useState`, and basic UI elements like `Button` and `Text`. It illustrates how TypeScript enhances type safety and autocompletion for React components.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/typescript.md#_snippet_6

LANGUAGE: tsx
CODE:

```
import {useState} from 'react';
import {Button, StyleSheet, Text, View} from 'react-native';

export type Props = {
  name: string;
  baseEnthusiasmLevel?: number;
};

function Hello({name, baseEnthusiasmLevel = 0}: Props) {
  const [enthusiasmLevel, setEnthusiasmLevel] = useState(
    baseEnthusiasmLevel,
  );

  const onIncrement = () =>
    setEnthusiasmLevel(enthusiasmLevel + 1);
  const onDecrement = () =>
    setEnthusiasmLevel(
      enthusiasmLevel > 0 ? enthusiasmLevel - 1 : 0,
    );

  const getExclamationMarks = (numChars: number) =>
    numChars > 0 ? Array(numChars + 1).join('!') : '';

  return (
    <View style={styles.container}>
      <Text style={styles.greeting}>
        Hello {name}
        {getExclamationMarks(enthusiasmLevel)}
      </Text>
      <View>
        <Button
          title="Increase enthusiasm"
          accessibilityLabel="increment"
          onPress={onIncrement}
          color="blue"
        />
        <Button
          title="Decrease enthusiasm"
          accessibilityLabel="decrement"
          onPress={onDecrement}
          color="red"
        />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  greeting: {
    fontSize: 20,
    fontWeight: 'bold',
    margin: 16,
  },
});

export default Hello;
```

---

TITLE: Using Flex Dimensions for Dynamic Sizing in React Native
DESCRIPTION: This example illustrates the use of the `flex` property in React Native to enable components to dynamically expand and shrink based on available space. The `flex` value determines the ratio of space a component occupies relative to its siblings, requiring the parent component to have defined dimensions greater than zero for children to be visible.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/height-and-width.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View} from 'react-native';

const FlexDimensionsBasics = () => {
  return (
    // Try removing the `flex: 1` on the parent View.
    // The parent will not have dimensions, so the children can't expand.
    // What if you add `height: 300` instead of `flex: 1`?
    <View style={{flex: 1}}>
      <View style={{flex: 1, backgroundColor: 'powderblue'}} />
      <View style={{flex: 2, backgroundColor: 'skyblue'}} />
      <View style={{flex: 3, backgroundColor: 'steelblue'}} />
    </View>
  );
};

export default FlexDimensionsBasics;
```

---

TITLE: Example Usage of `renderItem` and `ItemSeparatorComponent` in React Native FlatList (TSX)
DESCRIPTION: Illustrates a practical implementation of `FlatList` using `renderItem` to display data and `ItemSeparatorComponent` for visual separation. It demonstrates how to use `separators.highlight` and `separators.unhighlight` for interactive separator styling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/flatlist.md#_snippet_3

LANGUAGE: TypeScript
CODE:

```
<FlatList
  ItemSeparatorComponent={
    Platform.OS !== 'android' &&
    (({highlighted}) => (
      <View
        style={[style.separator, highlighted && {marginLeft: 0}]}
      />
    ))
  }
  data={[{title: 'Title Text', key: 'item1'}]}
  renderItem={({item, index, separators}) => (
    <TouchableHighlight
      key={item.key}
      onPress={() => this._onPress(item)}
      onShowUnderlay={separators.highlight}
      onHideUnderlay={separators.unhighlight}>
      <View style={{backgroundColor: 'white'}}>
        <Text>{item.title}</Text>
      </View>
    </TouchableHighlight>
  )}
/>
```

---

TITLE: Implementing Blinking Text with State in React Native (JavaScript)
DESCRIPTION: This snippet demonstrates how to create a blinking text component in React Native using functional components and React Hooks. It utilizes `useState` to manage the `isShowingText` state, which toggles visibility, and `useEffect` to set up and clear a `setInterval` timer that updates the state every second. The `props.text` is used for the static text content.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/state.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React, {useState, useEffect} from 'react';
import {Text, View} from 'react-native';

const Blink = props => {
  const [isShowingText, setIsShowingText] = useState(true);

  useEffect(() => {
    const toggle = setInterval(() => {
      setIsShowingText(!isShowingText);
    }, 1000);

    return () => clearInterval(toggle);
  });

  if (!isShowingText) {
    return null;
  }

  return <Text>{props.text}</Text>;
};

const BlinkApp = () => {
  return (
    <View style={{marginTop: 50}}>
      <Blink text="I love to blink" />
      <Blink text="Yes blinking is so great" />
      <Blink text="Why did they ever take this out of HTML" />
      <Blink text="Look at me look at me look at me" />
    </View>
  );
};

export default BlinkApp;
```

---

TITLE: Passing Props to Custom Components (TS)
DESCRIPTION: This TypeScript example demonstrates passing `props` to a custom React component, including type definition for the props. The `Cat` component receives a `name` prop, which is then used to customize the text rendered for each cat instance in the `Cafe` component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/intro-react.md#_snippet_11

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

type CatProps = {
  name: string;
};

const Cat = (props: CatProps) => {
  return (
    <View>
      <Text>Hello, I am {props.name}!</Text>
    </View>
  );
};

const Cafe = () => {
  return (
    <View>
      <Cat name="Maru" />
      <Cat name="Jellylorum" />
      <Cat name="Spot" />
    </View>
  );
};

export default Cafe;
```

---

TITLE: Upgrading React Native Dependencies with Yarn
DESCRIPTION: This snippet illustrates how to update the `react-native` and `react` packages in a React Native project using Yarn. Similar to npm, `{{VERSION}}` and `{{REACT_VERSION}}` should be replaced with the actual release versions from the diff. This command updates the project's `package.json` and installs the new dependency versions.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/upgrading.md#_snippet_1

LANGUAGE: shell
CODE:

```
yarn add react-native@{{VERSION}}
yarn add react@{{REACT_VERSION}}
```

---

TITLE: Creating Basic Styles with StyleSheet.create in React Native
DESCRIPTION: This snippet demonstrates the fundamental usage of StyleSheet.create to define and apply styles in a React Native component. Moving styles out of the render function improves code readability, encourages style reuse, and enables static type checking in most IDEs.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/stylesheet.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {StyleSheet, Text, View} from 'react-native';

const App = () => (
  <View style={styles.container}>
    <Text style={styles.title}>React Native</Text>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 24,
    backgroundColor: '#eaeaea',
  },
  title: {
    marginTop: 16,
    paddingVertical: 8,
    borderWidth: 4,
    borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: '#61dafb',
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
  },
});

export default App;
```

---

TITLE: Creating New React Native Project (Shell)
DESCRIPTION: This command initializes a new React Native project named 'AwesomeProject' using `npx`. `npx` ensures the latest stable version of the React Native CLI is used without global installation, creating the basic project structure.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/_getting-started-macos-ios.md#_snippet_2

LANGUAGE: shell
CODE:

```
npx react-native init AwesomeProject
```

---

TITLE: Running Registered Application - React Native AppRegistry - TSX
DESCRIPTION: This static method loads the JavaScript bundle and initiates the execution of the React Native application. It requires an `appKey` to identify the registered app and `appParameters` (any type) to pass initial props to the root component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/appregistry.md#_snippet_12

LANGUAGE: TSX
CODE:

```
static runApplication(appKey: string, appParameters: any): void;
```

---

TITLE: Configuring Gradle Settings for React Native Autolinking
DESCRIPTION: Modifies the `settings.gradle` file to include the React Native Gradle Plugin, enabling autolinking of libraries and configuring the build system to recognize React Native modules. This is crucial for integrating React Native into the Android project's build process and managing dependencies automatically.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/_integration-with-existing-apps-kotlin.md#_snippet_3

LANGUAGE: groovy
CODE:

```
// Configures the React Native Gradle Settings plugin used for autolinking
pluginManagement { includeBuild("../node_modules/@react-native/gradle-plugin") }
plugins { id("com.facebook.react.settings") }
extensions.configure(com.facebook.react.ReactSettingsExtension){ ex -> ex.autolinkLibrariesFromCommand() }
// If using .gradle.kts files:
// extensions.configure<com.facebook.react.ReactSettingsExtension> { autolinkLibrariesFromCommand() }
includeBuild("../node_modules/@react-native/gradle-plugin")

// Include your existing Gradle modules here.
// include(":app")
```

---

TITLE: Creating a Basic React Native 'Hello World' App with SnackPlayer
DESCRIPTION: This interactive example showcases a fundamental React Native application that displays 'Try editing me! 🎉' text. It utilizes `View` for layout and `Text` for displaying content, demonstrating a simple component structure. The snippet is embedded in a SnackPlayer, allowing real-time editing and previewing in the browser.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/introduction.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const YourApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Try editing me! 🎉</Text>
    </View>
  );
};

export default YourApp;
```

---

TITLE: Defining a Basic React Native Component
DESCRIPTION: This snippet defines a simple functional React Native component named `Cat`. It imports `React` and the `Text` Core Component, then returns a `Text` element displaying a greeting. The component is exported for use in other parts of the application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/intro-react.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const Cat = () => {
  return <Text>Hello, I am your cat!</Text>;
};

export default Cat;
```

---

TITLE: Updating State with Button onPress (TypeScript)
DESCRIPTION: This snippet illustrates how to modify a component's state by invoking the state setter function (`setIsHungry`) within the `onPress` event handler of a React Native `Button` component, triggering a re-render with the updated state.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/intro-react.md#_snippet_17

LANGUAGE: tsx
CODE:

```
<Button
  onPress={() => {
    setIsHungry(false);
  }}
  //..
/>
```

---

TITLE: Embedding JavaScript Variables in JSX
DESCRIPTION: This snippet shows how to embed a JavaScript variable, `name`, directly within JSX using curly braces. The `Cat` component defines a `name` constant and renders it inside a `Text` element, demonstrating dynamic content rendering.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/intro-react.md#_snippet_5

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const Cat = () => {
  const name = 'Maru';
  return <Text>Hello, I am {name}!</Text>;
};

export default Cat;
```

---

TITLE: Passing Props to React Components (TS)
DESCRIPTION: This TypeScript example shows how to pass and type 'props' for React components. A `CatProps` type defines the `name` prop as a string, ensuring type safety when the `Cafe` component passes different names to each `Cat` instance.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/intro-react.md#_snippet_11

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

type CatProps = {
  name: string;
};

const Cat = (props: CatProps) => {
  return (
    <View>
      <Text>Hello, I am {props.name}!</Text>
    </View>
  );
};

const Cafe = () => {
  return (
    <View>
      <Cat name="Maru" />
      <Cat name="Jellylorum" />
      <Cat name="Spot" />
    </View>
  );
};

export default Cafe;
```

---

TITLE: Managing High-Frequency UI Updates with React Native Transitions
DESCRIPTION: This example demonstrates how to use React 18's `useTransition` and `startTransition` in the New Architecture to manage high-frequency UI updates, such as those from a slider. By wrapping state updates in `startTransition`, rendering can be interrupted for higher-priority tasks, leading to a smoother UI with fewer intermediate states. It also utilizes `isPending` for visual feedback.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/the-new-architecture/landing-page.md#_snippet_2

LANGUAGE: jsx
CODE:

```
function TileSlider({value, onValueChange}) {
  const [isPending, startTransition] = useTransition();

  return (
    <>
      <View>
        <Text>
          Render {value} Tiles
        </Text>
        <ActivityIndicator animating={isPending} />
      </View>
      <Slider
        value={1}
        minimumValue={1}
        maximumValue={1000}
        step={1}
        onValueChange={newValue => {
          startTransition(() => {
            onValueChange(newValue);
          });
        }}
      />
    </>
  );
}

function ManyTiles() {
  const [value, setValue] = useState(1);
  const tiles = generateTileViews(value);
  return (
      <TileSlider onValueChange={setValue} value={value} />
      <View>
        {tiles}
      </View>
  )
}
```

---

TITLE: Implementing Flex Wrap in React Native (TypeScript)
DESCRIPTION: This TypeScript snippet demonstrates the `flexWrap` property in React Native, similar to the JavaScript version but with added type safety. It uses `useState` to manage the `flexWrap` value and includes a `PropsWithChildren` type definition for the `PreviewLayout` component. The example showcases how child elements are arranged within a container based on 'wrap' or 'nowrap' settings, with `StyleSheet` definitions for visual presentation.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/flexbox.md#_snippet_14

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';
import type {PropsWithChildren} from 'react';

const FlexWrapLayout = () => {
  const [flexWrap, setFlexWrap] = useState('wrap');

  return (
    <PreviewLayout
      label="flexWrap"
      selectedValue={flexWrap}
      values={['wrap', 'nowrap']}
      setSelectedValue={setFlexWrap}>
      <View style={[styles.box, {backgroundColor: 'orangered'}]} />
      <View style={[styles.box, {backgroundColor: 'orange'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumseagreen'}]} />
      <View style={[styles.box, {backgroundColor: 'deepskyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumturquoise'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumslateblue'}]} />
      <View style={[styles.box, {backgroundColor: 'purple'}]} />
    </PreviewLayout>
  );
};

type PreviewLayoutProps = PropsWithChildren<{
  label: string;
  values: string[];
  selectedValue: string;
  setSelectedValue: (value: string) => void;
}>;

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}: PreviewLayoutProps) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
    maxHeight: 400,
  },
  box: {
    width: 50,
    height: 80,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default FlexWrapLayout;

```

---

TITLE: Implementing Flex Wrap Layout in React Native (TypeScript)
DESCRIPTION: This TypeScript snippet demonstrates the `flexWrap` property in React Native, similar to the JavaScript version, but with added type safety. It uses a functional component `FlexWrapLayout` and defines a `PreviewLayoutProps` type for the `PreviewLayout` component, ensuring proper prop validation. The example illustrates how `wrap` and `nowrap` values affect element wrapping and includes `StyleSheet` for defining component styles.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/flexbox.md#_snippet_13

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';
import type {PropsWithChildren} from 'react';

const FlexWrapLayout = () => {
  const [flexWrap, setFlexWrap] = useState('wrap');

  return (
    <PreviewLayout
      label="flexWrap"
      selectedValue={flexWrap}
      values={['wrap', 'nowrap']}
      setSelectedValue={setFlexWrap}>
      <View style={[styles.box, {backgroundColor: 'orangered'}]} />
      <View style={[styles.box, {backgroundColor: 'orange'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumseagreen'}]} />
      <View style={[styles.box, {backgroundColor: 'deepskyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumturquoise'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumslateblue'}]} />
      <View style={[styles.box, {backgroundColor: 'purple'}]} />
    </PreviewLayout>
  );
};

type PreviewLayoutProps = PropsWithChildren<{
  label: string;
  values: string[];
  selectedValue: string;
  setSelectedValue: (value: string) => void;
}>;

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}: PreviewLayoutProps) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
    maxHeight: 400,
  },
  box: {
    width: 50,
    height: 80,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default FlexWrapLayout;
```

---

TITLE: Nesting Core Components in React Native
DESCRIPTION: This snippet demonstrates how to nest multiple React Native Core Components (`Text`, `TextInput`) inside a `View` component. It shows basic styling for `TextInput` and how to combine different UI elements to create a more complex component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/intro-react.md#_snippet_8

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, TextInput, View} from 'react-native';

const Cat = () => {
  return (
    <View>
      <Text>Hello, I am...</Text>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="Name me!"
      />
    </View>
  );
};

export default Cat;
```

---

TITLE: Implementing Blinking Text with React Native State (JavaScript)
DESCRIPTION: This snippet demonstrates how to create a blinking text component in React Native using functional components and the `useState` and `useEffect` hooks. The `isShowingText` state variable controls the visibility of the text, which is toggled every second using `setInterval`. The `useEffect` hook manages the timer, ensuring it's cleared on component unmount. The `BlinkApp` component then renders multiple instances of the `Blink` component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/state.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React, {useState, useEffect} from 'react';
import {Text, View} from 'react-native';

const Blink = props => {
  const [isShowingText, setIsShowingText] = useState(true);

  useEffect(() => {
    const toggle = setInterval(() => {
      setIsShowingText(!isShowingText);
    }, 1000);

    return () => clearInterval(toggle);
  });

  if (!isShowingText) {
    return null;
  }

  return <Text>{props.text}</Text>;
};

const BlinkApp = () => {
  return (
    <View style={{marginTop: 50}}>
      <Blink text="I love to blink" />
      <Blink text="Yes blinking is so great" />
      <Blink text="Why did they ever take this out of HTML" />
      <Blink text="Look at me look at me look at me" />
    </View>
  );
};

export default BlinkApp;
```

---

TITLE: Rendering Basic FlatList in React Native
DESCRIPTION: This example demonstrates how to render a simple, flat list of items using React Native's `FlatList` component. It defines a `DATA` array, a functional `Item` component for rendering individual list items, and an `App` component that uses `FlatList` to display the data. Styling is applied using `StyleSheet`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/flatlist.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {
  SafeAreaView,
  View,
  FlatList,
  StyleSheet,
  Text,
  StatusBar,
} from 'react-native';

const DATA = [
  {
    id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28ba',
    title: 'First Item',
  },
  {
    id: '3ac68afc-c605-48d3-a4f8-fbd91aa97f63',
    title: 'Second Item',
  },
  {
    id: '58694a0f-3da1-471f-bd96-145571e29d72',
    title: 'Third Item',
  },
];

const Item = ({title}) => (
  <View style={styles.item}>
    <Text style={styles.title}>{title}</Text>
  </View>
);

const App = () => {
  return (
    <SafeAreaView style={styles.container}>
      <FlatList
        data={DATA}
        renderItem={({item}) => <Item title={item.title} />}
        keyExtractor={item => item.id}
      />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: StatusBar.currentHeight || 0,
  },
  item: {
    backgroundColor: '#f9c2ff',
    padding: 20,
    marginVertical: 8,
    marginHorizontal: 16,
  },
  title: {
    fontSize: 32,
  },
});

export default App;
```

LANGUAGE: typescript
CODE:

```
import React from 'react';
import {
  SafeAreaView,
  View,
  FlatList,
  StyleSheet,
  Text,
  StatusBar,
} from 'react-native';

const DATA = [
  {
    id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28ba',
    title: 'First Item',
  },
  {
    id: '3ac68afc-c605-48d3-a4f8-fbd91aa97f63',
    title: 'Second Item',
  },
  {
    id: '58694a0f-3da1-471f-bd96-145571e29d72',
    title: 'Third Item',
  },
];

type ItemProps = {title: string};

const Item = ({title}: ItemProps) => (
  <View style={styles.item}>
    <Text style={styles.title}>{title}</Text>
  </View>
);

const App = () => {
  return (
    <SafeAreaView style={styles.container}>
      <FlatList
        data={DATA}
        renderItem={({item}) => <Item title={item.title} />}
        keyExtractor={item => item.id}
      />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: StatusBar.currentHeight || 0,
  },
  item: {
    backgroundColor: '#f9c2ff',
    padding: 20,
    marginVertical: 8,
    marginHorizontal: 16,
  },
  title: {
    fontSize: 32,
  },
});

export default App;
```

---

TITLE: Defining a Basic React Native Component (JSX)
DESCRIPTION: This snippet defines a simple React Native functional component named `MyComponent`. It returns a JSX structure consisting of a `View` component acting as a container, which encloses a `Text` component displaying 'Hello, World'. This component serves as an example to illustrate the initial render process within the React Native render pipeline, demonstrating how React Elements are reduced to Host Components.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/architecture/render-pipeline.md#_snippet_0

LANGUAGE: jsx
CODE:

```
function MyComponent() {
  return (
    <View>
      <Text>Hello, World</Text>
    </View>
  );
}

// <MyComponent />
```

---

TITLE: Controlling Flex Direction in React Native (TypeScript)
DESCRIPTION: This example, similar to the JavaScript version, illustrates the `flexDirection` property in TypeScript, defining the primary axis along which child components are laid out. It demonstrates dynamic direction changes (column, row, column-reverse, row-reverse) using state and interactive buttons, including type definitions for props to enhance code clarity and maintainability.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/flexbox.md#_snippet_2

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {StyleSheet, Text, TouchableOpacity, View} from 'react-native';
import type {PropsWithChildren} from 'react';

const FlexDirectionBasics = () => {
  const [flexDirection, setflexDirection] = useState('column');

  return (
    <PreviewLayout
      label="flexDirection"
      values={['column', 'row', 'column-reverse', 'row-reverse']}
      selectedValue={flexDirection}
      setSelectedValue={setflexDirection}>
      <View style={[styles.box, {backgroundColor: 'powderblue'}]} />
      <View style={[styles.box, {backgroundColor: 'skyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'steelblue'}]} />
    </PreviewLayout>
  );
};

type PreviewLayoutProps = PropsWithChildren<{
  label: string;
  values: string[];
  selectedValue: string;
  setSelectedValue: (value: string) => void;
}>;

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}: PreviewLayoutProps) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default FlexDirectionBasics;
```

---

TITLE: Creating a New React Native Project
DESCRIPTION: This command initializes a new React Native project named 'AwesomeProject' using the latest version of the React Native Community CLI. It sets up the basic project structure and dependencies for a barebones React Native application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/get-started-without-a-framework.md#_snippet_0

LANGUAGE: shell
CODE:

```
npx @react-native-community/cli@latest init AwesomeProject
```

---

TITLE: Passing Custom Props to Components (TypeScript)
DESCRIPTION: This TypeScript example demonstrates defining and using custom props with type safety. It defines a `GreetingProps` type for the `name` prop, ensuring that the `Greeting` component receives a string for its `name`. The `LotsOfGreetings` component reuses `Greeting` with different names, similar to the JavaScript version.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/props.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

type GreetingProps = {
  name: string;
};

const Greeting = (props: GreetingProps) => {
  return (
    <View style={{alignItems: 'center'}}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={{alignItems: 'center', top: 50}}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Increasing Tappable Area with hitSlop in React Native
DESCRIPTION: This snippet illustrates the use of the `hitSlop` prop on `TouchableOpacity` to expand the interactive touch area of a component without changing its visual dimensions. It compares a button without `hitSlop` to one with `hitSlop` applied, making the latter easier to tap. Dependencies include `React`, `TouchableOpacity`, `View`, `Text`, `StatusBar`, and `StyleSheet` from `react-native`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/improvingux.md#_snippet_4

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {
  Text,
  StatusBar,
  TouchableOpacity,
  View,
  StyleSheet,
} from 'react-native';

const App = () => {
  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      <View style={styles.header}>
        <Text style={styles.description}>
          This demo shows how using hitSlop can make interactive elements much
          easier to tap without changing their layout and size. Try pressing
          each button quickly multiple times and notice which one is easier to
          hit.
        </Text>
      </View>
      <View style={styles.content}>
        <TouchableOpacity>
          <Text style={styles.label}>Without hitSlop</Text>
        </TouchableOpacity>
        <View style={styles.separator} />
        <View style={styles.preview}>
          <TouchableOpacity
            hitSlop={{top: 20, left: 20, bottom: 20, right: 20}}>
            <Text style={styles.label}>With hitSlop</Text>
          </TouchableOpacity>
        </View>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    paddingTop: 64,
    padding: 20,
    backgroundColor: '#282c34',
  },
  description: {
    fontSize: 14,
    color: 'white',
  },
  content: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  label: {
    fontSize: 18,
    color: '#336699',
    textAlign: 'center',
    borderColor: '#ddd',
    borderWidth: 1,
  },
  separator: {
    height: 50,
  },
  preview: {
    padding: 20,
    backgroundColor: '#f6f6f6',
  },
});

export default App;
```

---

TITLE: Importing useState Hook (TypeScript)
DESCRIPTION: This snippet shows the essential import statement for the `useState` Hook from the React library, which is a prerequisite for adding state to functional components in React Native.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/intro-react.md#_snippet_15

LANGUAGE: tsx
CODE:

```
import React, {useState} from 'react';
```

---

TITLE: Implementing a React Native Functional Component
DESCRIPTION: This example illustrates how to create a simple 'Hello, world!' application using a React Native functional component. It showcases basic UI rendering with `Text` and `View` components, centered on the screen, representing the modern and recommended approach for React components.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/introduction.md#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import { Text, View } from 'react-native';

const HelloWorldApp = () => {
  return (
    <View style={{
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center'
    }}>
      <Text>Hello, world!</Text>
    </View>
  );
}

export default HelloWorldApp;
```

---

TITLE: Configuring TextInput for Forms in React Native (TypeScript)
DESCRIPTION: This snippet provides a TypeScript implementation of a user-friendly form utilizing React Native's TextInput component. It demonstrates how to leverage TextInput props like autoFocus, autoCapitalize, keyboardType, and returnKeyType for optimized input, and how to manage input focus flow using useRef with type annotations and onSubmitEditing.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/improvingux.md#_snippet_1

LANGUAGE: typescript
CODE:

```
import React, {useState, useRef} from 'react';
import {
  Alert,
  Text,
  StatusBar,
  TextInput,
  View,
  StyleSheet,
} from 'react-native';

const App = () => {
  const emailInput = useRef<TextInput>(null);
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');

  const submit = () => {
    Alert.alert(
      `Welcome, ${name}! Confirmation email has been sent to ${email}`,
    );
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      <View style={styles.header}>
        <Text style={styles.description}>
          This demo shows how using available TextInput customizations can make
          forms much easier to use. Try completing the form and notice that
          different fields have specific optimizations and the return key
          changes from focusing next input to submitting the form.
        </Text>
      </View>
      <TextInput
        style={styles.input}
        value={name}
        onChangeText={text => setName(text)}
        placeholder="Full Name"
        autoFocus={true}
        autoCapitalize="words"
        autoCorrect={true}
        keyboardType="default"
        returnKeyType="next"
        onSubmitEditing={() => emailInput.current?.focus()}
        blurOnSubmit={false}
      />
      <TextInput
        style={styles.input}
        value={email}
        onChangeText={text => setEmail(text)}
        ref={emailInput}
        placeholder="email@example.com"
        autoCapitalize="none"
        autoCorrect={false}
        keyboardType="email-address"
        returnKeyType="send"
        onSubmitEditing={submit}
        blurOnSubmit={true}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    paddingTop: 64,
    padding: 20,
    backgroundColor: '#282c34',
  },
  description: {
    fontSize: 14,
    color: 'white',
  },
  input: {
    margin: 20,
    marginBottom: 0,
    height: 34,
    paddingHorizontal: 10,
    borderRadius: 4,
    borderColor: '#ccc',
    borderWidth: 1,
    fontSize: 16,
  },
});

export default App;
```

---

TITLE: Creating and Applying Styles with StyleSheet in React Native
DESCRIPTION: This snippet demonstrates the fundamental usage of `StyleSheet.create()` to define a set of styles and apply them to React Native components. It showcases how to structure styles separately from the component's render logic, improving readability and encouraging reuse. The example uses `SafeAreaView` and `SafeAreaProvider` for proper layout on devices with safe areas.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/stylesheet.md#_snippet_0

LANGUAGE: React Native
CODE:

```
import React from 'react';
import {StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Text style={styles.title}>React Native</Text>
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 24,
    backgroundColor: '#eaeaea',
  },
  title: {
    marginTop: 16,
    paddingVertical: 8,
    borderWidth: 4,
    borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: '#61dafb',
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
  },
});

export default App;
```

---

TITLE: Creating a Hello World App in React Native
DESCRIPTION: This snippet demonstrates the simplest React Native application, rendering 'Hello, world!' on the screen. It imports `React` for JSX, and `Text` and `View` components from `react-native` to construct the UI. The `View` component acts as a container, styled to center its content.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/tutorial.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, View} from 'react-native';

const HelloWorldApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Hello, world!</Text>
    </View>
  );
};
export default HelloWorldApp;
```

---

TITLE: Embedding JavaScript Variables in JSX
DESCRIPTION: This snippet illustrates how to embed JavaScript variables directly within JSX using curly braces `{}`. It defines a `name` variable and displays its value inside a `Text` component, demonstrating dynamic content rendering in React Native.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/intro-react.md#_snippet_5

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const Cat = () => {
  const name = 'Maru';
  return <Text>Hello, I am {name}!</Text>;
};

export default Cat;
```

---

TITLE: Applying alignItems in React Native (TypeScript)
DESCRIPTION: This snippet demonstrates how to use the `alignItems` style property in React Native with TypeScript to control the alignment of child components along the cross-axis. It includes an interactive `PreviewLayout` component with type definitions to switch between different `alignItems` values, showcasing their visual effects.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/flexbox.md#_snippet_8

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';
import type {PropsWithChildren} from 'react';

const AlignItemsLayout = () => {
  const [alignItems, setAlignItems] = useState('stretch');

  return (
    <PreviewLayout
      label="alignItems"
      selectedValue={alignItems}
      values={['stretch', 'flex-start', 'flex-end', 'center', 'baseline']}
      setSelectedValue={setAlignItems}>
      <View style={[styles.box, {backgroundColor: 'powderblue'}]} />
      <View style={[styles.box, {backgroundColor: 'skyblue'}]} />
      <View
        style={[
          styles.box,
          {
            backgroundColor: 'steelblue',
            width: 'auto',
            minWidth: 50,
          },
        ]}
      />
    </PreviewLayout>
  );
};

type PreviewLayoutProps = PropsWithChildren<{
  label: string;
  values: string[];
  selectedValue: string;
  setSelectedValue: (value: string) => void;
}>;

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}: PreviewLayoutProps) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
    minHeight: 200,
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default AlignItemsLayout;
```

---

TITLE: Accessing React Native Logs (Shell)
DESCRIPTION: This snippet provides shell commands to display native logs for React Native applications. `npx react-native log-android` is used for Android, and `npx react-native log-ios` is used for iOS, allowing developers to monitor app activity in real-time.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/debugging-native-code.md#_snippet_0

LANGUAGE: Shell
CODE:

```
# For Android:
npx react-native log-android
# Or, for iOS:
npx react-native log-ios
```

---

TITLE: Installing Core React Navigation Packages (npm)
DESCRIPTION: Installs the essential React Navigation libraries, `@react-navigation/native` for the core navigation functionality and `@react-navigation/native-stack` for native stack navigation, using npm.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/navigation.md#_snippet_0

LANGUAGE: shell
CODE:

```
npm install @react-navigation/native @react-navigation/native-stack
```

---

TITLE: Implementing LayoutAnimation for Dynamic View Updates in React Native
DESCRIPTION: This comprehensive example showcases how to use `LayoutAnimation.spring()` to automatically animate changes in view dimensions (`width` and `height`) when a button is pressed. It illustrates `LayoutAnimation`'s ability to simplify animating global layout updates without manual property tracking.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/animations.md#_snippet_18

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {
  NativeModules,
  LayoutAnimation,
  Text,
  TouchableOpacity,
  StyleSheet,
  View,
} from 'react-native';

const {UIManager} = NativeModules;

UIManager.setLayoutAnimationEnabledExperimental &&
  UIManager.setLayoutAnimationEnabledExperimental(true);

export default class App extends React.Component {
  state = {
    w: 100,
    h: 100,
  };

  _onPress = () => {
    // Animate the update
    LayoutAnimation.spring();
    this.setState({w: this.state.w + 15, h: this.state.h + 15});
  };

  render() {
    return (
      <View style={styles.container}>
        <View
          style={[styles.box, {width: this.state.w, height: this.state.h}]}
        />
        <TouchableOpacity onPress={this._onPress}>
          <View style={styles.button}>
            <Text style={styles.buttonText}>Press me!</Text>
          </View>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 200,
    height: 200,
    backgroundColor: 'red',
  },
  button: {
    backgroundColor: 'black',
    paddingHorizontal: 20,
    paddingVertical: 15,
    marginTop: 15,
  },
  buttonText: {
    color: '#fff',
    fontWeight: 'bold',
  },
});
```

---

TITLE: Using Props with Functional Components in React Native (TypeScript)
DESCRIPTION: This snippet is a TypeScript version of the `props` example, showcasing type definitions for component props. The `GreetingProps` type ensures that the `name` prop passed to the `Greeting` component is a string, providing type safety and improved developer experience.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/tutorial.md#_snippet_2

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {Text, View, StyleSheet} from 'react-native';

const styles = StyleSheet.create({
  center: {
    alignItems: 'center',
  },
});

type GreetingProps = {
  name: string;
};

const Greeting = (props: GreetingProps) => {
  return (
    <View style={styles.center}>
      <Text>Hello {props.name}!</Text>
    </View>
  );
};

const LotsOfGreetings = () => {
  return (
    <View style={[styles.center, {top: 50}]}>
      <Greeting name="Rexxar" />
      <Greeting name="Jaina" />
      <Greeting name="Valeera" />
    </View>
  );
};

export default LotsOfGreetings;
```

---

TITLE: Installing React Native Core Package
DESCRIPTION: These commands install the `react-native` package using either npm or Yarn, which are essential package managers for JavaScript. This step sets up the core framework dependencies required for React Native development.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/_integration-with-existing-apps-java.md#_snippet_15

LANGUAGE: shell
CODE:

```
npm install react-native
```

LANGUAGE: shell
CODE:

```
yarn add react-native
```

---

TITLE: Applying View Style Props in React Native
DESCRIPTION: This React Native example demonstrates how to apply various style properties to `View` components using `StyleSheet.create`. It showcases `flex` for layout, `justifyContent`, `padding`, `margin`, `backgroundColor`, `borderWidth`, and `borderRadius` to style different sections of the UI within a `SafeAreaView` for proper screen layout.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/view-style-props.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <View style={styles.top} />
      <View style={styles.middle} />
      <View style={styles.bottom} />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-between',
    padding: 20,
    margin: 10,
  },
  top: {
    flex: 0.3,
    backgroundColor: 'grey',
    borderWidth: 5,
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
  },
  middle: {
    flex: 0.3,
    backgroundColor: 'beige',
    borderWidth: 5,
  },
  bottom: {
    flex: 0.3,
    backgroundColor: 'pink',
    borderWidth: 5,
    borderBottomLeftRadius: 20,
    borderBottomRightRadius: 20,
  },
});

export default App;
```

---

TITLE: Basic Pressable Usage in React Native
DESCRIPTION: This snippet demonstrates the basic usage of the `Pressable` component in React Native, wrapping a `Text` component. It shows how to attach an `onPress` event handler to respond to simple press interactions.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/pressable.md#_snippet_0

LANGUAGE: tsx
CODE:

```
<Pressable onPress={onPressFunction}>
  <Text>I'm pressable!</Text>
</Pressable>
```

---

TITLE: Navigating Between Screens and Passing Params
DESCRIPTION: This JSX snippet illustrates how to navigate between screens and pass parameters using the navigation prop. The HomeScreen uses navigation.navigate('Profile', {name: 'Jane'}) to transition to the Profile screen, while ProfileScreen accesses the passed parameters via route.params.name.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/navigation.md#_snippet_6

LANGUAGE: jsx
CODE:

```
const HomeScreen = ({navigation}) => {
  return (
    <Button
      title="Go to Jane's profile"
      onPress={() =>
        navigation.navigate('Profile', {name: 'Jane'})
      }
    />
  );
};
const ProfileScreen = ({navigation, route}) => {
  return <Text>This is {route.params.name}'s profile</Text>;
};
```

---

TITLE: Creating a New React Native Project (Shell)
DESCRIPTION: This command uses `npx` to initialize a new React Native project named 'AwesomeProject' with the latest stable version of the React Native CLI. It sets up the basic project structure and dependencies, making it ready for development.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/_getting-started-macos-android.md#_snippet_4

LANGUAGE: Shell
CODE:

```
npx react-native@latest init AwesomeProject
```

---

TITLE: Controlling Flex Wrap in React Native (TypeScript)
DESCRIPTION: This TypeScript snippet demonstrates the `flexWrap` property in React Native, similar to the JavaScript example. It utilizes `useState` to manage the `flexWrap` state and includes type definitions (`PropsWithChildren`, `PreviewLayoutProps`) for enhanced type safety. The example shows how child `View` components wrap or overflow based on the selected `flexWrap` value, providing an interactive demonstration of the layout property.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/flexbox.md#_snippet_14

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';
import type {PropsWithChildren} from 'react';

const FlexWrapLayout = () => {
  const [flexWrap, setFlexWrap] = useState('wrap');

  return (
    <PreviewLayout
      label="flexWrap"
      selectedValue={flexWrap}
      values={['wrap', 'nowrap']}
      setSelectedValue={setFlexWrap}>
      <View style={[styles.box, {backgroundColor: 'orangered'}]} />
      <View style={[styles.box, {backgroundColor: 'orange'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumseagreen'}]} />
      <View style={[styles.box, {backgroundColor: 'deepskyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumturquoise'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumslateblue'}]} />
      <View style={[styles.box, {backgroundColor: 'purple'}]} />
    </PreviewLayout>
  );
};

type PreviewLayoutProps = PropsWithChildren<{
  label: string;
  values: string[];
  selectedValue: string;
  setSelectedValue: (value: string) => void;
}>;

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}: PreviewLayoutProps) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
    maxHeight: 400,
  },
  box: {
    width: 50,
    height: 80,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default FlexWrapLayout;
```

---

TITLE: Implementing Flex Wrap Layout in React Native (TypeScript)
DESCRIPTION: This TypeScript snippet demonstrates the `flexWrap` property in React Native, similar to the JavaScript example but with added type definitions. It utilizes `useState` to control the `flexWrap` value ('wrap' or 'nowrap') and illustrates how child components respond to this property. The `PreviewLayout` component is typed with `PropsWithChildren` to ensure proper prop validation, and `StyleSheet.create` is used for consistent styling.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.75/flexbox.md#_snippet_13

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';
import type {PropsWithChildren} from 'react';

const FlexWrapLayout = () => {
  const [flexWrap, setFlexWrap] = useState('wrap');

  return (
    <PreviewLayout
      label="flexWrap"
      selectedValue={flexWrap}
      values={['wrap', 'nowrap']}
      setSelectedValue={setFlexWrap}>
      <View style={[styles.box, {backgroundColor: 'orangered'}]} />
      <View style={[styles.box, {backgroundColor: 'orange'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumseagreen'}]} />
      <View style={[styles.box, {backgroundColor: 'deepskyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumturquoise'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumslateblue'}]} />
      <View style={[styles.box, {backgroundColor: 'purple'}]} />
    </PreviewLayout>
  );
};

type PreviewLayoutProps = PropsWithChildren<{
  label: string;
  values: string[];
  selectedValue: string;
  setSelectedValue: (value: string) => void;
}>;

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}: PreviewLayoutProps) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
    maxHeight: 400,
  },
  box: {
    width: 50,
    height: 80,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default FlexWrapLayout;

```

---

TITLE: Implementing Align Items Layout in React Native (JavaScript)
DESCRIPTION: This React Native component demonstrates the `alignItems` layout property using an interactive UI. Users can select different `alignItems` values (`stretch`, `flex-start`, `flex-end`, `center`, `baseline`) to observe their effect on child elements within a container. It includes a `PreviewLayout` component for reusable UI and defines styles for the layout.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/flexbox.md#_snippet_7

LANGUAGE: JavaScript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';

const AlignItemsLayout = () => {
  const [alignItems, setAlignItems] = useState('stretch');

  return (
    <PreviewLayout
      label="alignItems"
      selectedValue={alignItems}
      values={['stretch', 'flex-start', 'flex-end', 'center', 'baseline']}
      setSelectedValue={setAlignItems}>
      <View style={[styles.box, {backgroundColor: 'powderblue'}]} />
      <View style={[styles.box, {backgroundColor: 'skyblue'}]} />
      <View
        style={[
          styles.box,
          {
            backgroundColor: 'steelblue',
            width: 'auto',
            minWidth: 50,
          },
        ]}
      />
    </PreviewLayout>
  );
};

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
    minHeight: 200,
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default AlignItemsLayout;
```

---

TITLE: Styling Views with Flexbox and Borders in React Native
DESCRIPTION: This React Native example demonstrates how to apply various style properties to `View` components using `StyleSheet.create`. It showcases the use of flexbox for layout (`flex`, `justifyContent`), background colors, padding, margins, border properties (`borderWidth`, `borderRadius`), and specific corner radii to create a visually distinct three-part layout. The component exports `ViewStyleProps` for use in other parts of a React Native application.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/view-style-props.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {View, StyleSheet} from 'react-native';

const ViewStyleProps = () => {
  return (
    <View style={styles.container}>
      <View style={styles.top} />
      <View style={styles.middle} />
      <View style={styles.bottom} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-between',
    backgroundColor: '#fff',
    padding: 20,
    margin: 10,
  },
  top: {
    flex: 0.3,
    backgroundColor: 'grey',
    borderWidth: 5,
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
  },
  middle: {
    flex: 0.3,
    backgroundColor: 'beige',
    borderWidth: 5,
  },
  bottom: {
    flex: 0.3,
    backgroundColor: 'pink',
    borderWidth: 5,
    borderBottomLeftRadius: 20,
    borderBottomRightRadius: 20,
  },
});

export default ViewStyleProps;
```

---

TITLE: Installing React Native with npm
DESCRIPTION: This command installs the `react-native` package using npm. It's a crucial step for setting up the JavaScript development environment, providing the core React Native framework and CLI tools. This command should be run in the project's root directory where `package.json` resides.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.74/_integration-with-existing-apps-java.md#_snippet_1

LANGUAGE: Shell
CODE:

```
npm install react-native
```

---

TITLE: Starting Metro Bundler for React Native (CLI)
DESCRIPTION: This command starts the Metro JavaScript bundler, which is an essential component for React Native applications. Metro takes the entry file and options, then bundles all your code and its dependencies into a single JavaScript file. It should be run in its own dedicated terminal.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/_getting-started-macos-android.md#_snippet_7

LANGUAGE: shell
CODE:

```
npx react-native start
```

---

TITLE: Initializing a React Native Project with Community CLI
DESCRIPTION: This command demonstrates how to initialize a new React Native project using the `@react-native-community/cli` package. The `init` command has moved out of the core React Native CLI and is now accessed via `npx` from the community package, providing a way to start a new project without a full framework.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/blog/2024-06-25-use-a-framework-to-build-react-native-apps.md#_snippet_0

LANGUAGE: Shell
CODE:

```
npx @react-native-community/cli@latest init
```

---

TITLE: Tracking Scroll Position with Animated.event and Native Driver in React Native
DESCRIPTION: This example shows how to use `Animated.ScrollView` in conjunction with `Animated.event` and the native driver to track scroll position. By setting `useNativeDriver: true` in `Animated.event`'s config, scroll-driven animations can run directly on the UI thread, preventing lag often seen with asynchronous JavaScript-based scroll animations. The `y` offset of the scroll view's `contentOffset` is mapped to `this.state.animatedValue`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/animations.md#_snippet_15

LANGUAGE: tsx
CODE:

```
<Animated.ScrollView // <-- Use the Animated ScrollView wrapper
  onScroll={Animated.event(
    [
      {
        nativeEvent: {
          contentOffset: {y: this.state.animatedValue},
        },
      },
    ],
    {useNativeDriver: true}, // <-- Set this to true
  )}>
  {content}
</Animated.ScrollView>
```

---

TITLE: Updating State on Button Press in React Native (TypeScript)
DESCRIPTION: This snippet demonstrates how to attach an `onPress` handler to a `Button` component to update the `isHungry` state variable to `false` when the button is pressed, triggering a re-render of the component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/intro-react.md#_snippet_17

LANGUAGE: typescript
CODE:

```
<Button
  onPress={() => {
    setIsHungry(false);
  }}
  //..
/>
```

---

TITLE: Installing React Native with npm
DESCRIPTION: Installs the `react-native` package using npm, adding it as a dependency to the project. This command fetches the necessary React Native libraries and tools for development.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/_integration-with-existing-apps-kotlin.md#_snippet_1

LANGUAGE: shell
CODE:

```
npm install react-native
```

---

TITLE: Applying justifyContent in React Native (JavaScript)
DESCRIPTION: This React Native component demonstrates the usage of the `justifyContent` style property. It uses `useState` to dynamically change the alignment of child `View` components within a container, allowing users to interactively explore different `justifyContent` values like `flex-start`, `center`, and `space-between`. The `PreviewLayout` component handles the UI for selecting values and rendering the aligned boxes.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/flexbox.md#_snippet_5

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';

const JustifyContentBasics = () => {
  const [justifyContent, setJustifyContent] = useState('flex-start');

  return (
    <PreviewLayout
      label="justifyContent"
      selectedValue={justifyContent}
      values={[
        'flex-start',
        'flex-end',
        'center',
        'space-between',
        'space-around',
        'space-evenly',
      ]}
      setSelectedValue={setJustifyContent}>
      <View style={[styles.box, {backgroundColor: 'powderblue'}]} />
      <View style={[styles.box, {backgroundColor: 'skyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'steelblue'}]} />
    </PreviewLayout>
  );
};

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default JustifyContentBasics;
```

---

TITLE: Demonstrating alignContent in React Native (TypeScript)
DESCRIPTION: This React Native component, `AlignContentLayout`, demonstrates the effect of the `alignContent` style property using TypeScript. It leverages `useState` to control the `alignContent` value and displays multiple colored boxes within a `PreviewLayout` component, enabling interactive exploration of how wrapped lines are distributed along the cross-axis, with added type safety.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/flexbox.md#_snippet_11

LANGUAGE: typescript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';
import type {PropsWithChildren} from 'react';

const AlignContentLayout = () => {
  const [alignContent, setAlignContent] = useState('flex-start');

  return (
    <PreviewLayout
      label="alignContent"
      selectedValue={alignContent}
      values={[
        'flex-start',
        'flex-end',
        'stretch',
        'center',
        'space-between',
        'space-around',
      ]}
      setSelectedValue={setAlignContent}>
      <View style={[styles.box, {backgroundColor: 'orangered'}]} />
      <View style={[styles.box, {backgroundColor: 'orange'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumseagreen'}]} />
      <View style={[styles.box, {backgroundColor: 'deepskyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumturquoise'}]} />
      <View style={[styles.box, {backgroundColor: 'mediumslateblue'}]} />
      <View style={[styles.box, {backgroundColor: 'purple'}]} />
    </PreviewLayout>
  );
};

type PreviewLayoutProps = PropsWithChildren<{
  label: string;
  values: string[];
  selectedValue: string;
  setSelectedValue: (value: string) => void;
}>;

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}: PreviewLayoutProps) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexWrap: 'wrap',
    marginTop: 8,
    backgroundColor: 'aliceblue',
    maxHeight: 400,
  },
  box: {
    width: 50,
    height: 80,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default AlignContentLayout;
```

---

TITLE: Embedding JavaScript Function Calls in JSX (TS)
DESCRIPTION: This TypeScript example demonstrates embedding a JavaScript function call within JSX, similar to the JavaScript version, but with type annotations. The `getFullName` function, typed for string parameters, returns a concatenated string rendered dynamically in the `Text` component.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/intro-react.md#_snippet_7

LANGUAGE: TypeScript
CODE:

```
import React from 'react';
import {Text} from 'react-native';

const getFullName = (
  firstName: string,
  secondName: string,
  thirdName: string,
) => {
  return firstName + ' ' + secondName + ' ' + thirdName;
};

const Cat = () => {
  return <Text>Hello, I am {getFullName('Rum', 'Tum', 'Tugger')}!</Text>;
};

export default Cat;
```

---

TITLE: Example Usage of FlatList with renderItem and ItemSeparatorComponent (React Native)
DESCRIPTION: Illustrates how to use the `FlatList` component with `renderItem` to render individual items and `ItemSeparatorComponent` for custom separators. It shows how `separators.highlight` and `separators.unhighlight` can be used with `TouchableHighlight` to manage separator appearance based on interaction.
SOURCE: https://github.com/facebook/react-native-website/blob/main/docs/flatlist.md#_snippet_3

LANGUAGE: TypeScript
CODE:

```
<FlatList
  ItemSeparatorComponent={
    Platform.OS !== 'android' &&
    (({highlighted}) => (
      <View
        style={[style.separator, highlighted && {marginLeft: 0}]}
      />
    ))
  }
  data={[{title: 'Title Text', key: 'item1'}]}
  renderItem={({item, index, separators}) => (
    <TouchableHighlight
      key={item.key}
      onPress={() => this._onPress(item)}
      onShowUnderlay={separators.highlight}
      onHideUnderlay={separators.unhighlight}>
      <View style={{backgroundColor: 'white'}}>
        <Text>{item.title}</Text>
      </View>
    </TouchableHighlight>
  )}
/>
```

---

TITLE: Starting React Native App on Default iOS Simulator (npm/yarn)
DESCRIPTION: These commands initiate and run a React Native application on the default iOS simulator. They are executed from within the project directory after the React Native project has been initialized.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/running-on-simulator-ios.md#_snippet_0

LANGUAGE: Shell
CODE:

```
npm run ios
```

LANGUAGE: Shell
CODE:

```
yarn ios
```

---

TITLE: Basic Button Usage in React Native
DESCRIPTION: This snippet demonstrates the basic usage of the React Native `Button` component. It sets the `onPress` handler for user interaction, defines the `title` text, specifies a `color` for the button, and includes an `accessibilityLabel` for screen readers.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.71/button.md#_snippet_0

LANGUAGE: tsx
CODE:

```
<Button
  onPress={onPressLearnMore}
  title="Learn More"
  color="#841584"
  accessibilityLabel="Learn more about this purple button"
/>
```

---

TITLE: Nesting Core Components in React Native
DESCRIPTION: This snippet demonstrates how to nest React Native Core Components like `Text` and `TextInput` inside a `View` component. It shows how to apply basic styling to `TextInput` and provides a default value, illustrating how to compose complex UIs from simpler components.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.77/intro-react.md#_snippet_8

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {Text, TextInput, View} from 'react-native';

const Cat = () => {
  return (
    <View>
      <Text>Hello, I am...</Text>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="Name me!"
      />
    </View>
  );
};

export default Cat;
```

---

TITLE: Nesting React Native Core Components
DESCRIPTION: This snippet shows how to nest React Native's Core Components like `Text` and `TextInput` inside a `View` component. This demonstrates how to build more complex UI structures by combining simpler components.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.78/intro-react.md#_snippet_8

LANGUAGE: javascript
CODE:

```
import React from 'react';
import {Text, TextInput, View} from 'react-native';

const Cat = () => {
  return (
    <View>
      <Text>Hello, I am...</Text>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="Name me!"
      />
    </View>
  );
};

export default Cat;
```

---

TITLE: Interactive Flexbox Layout Demonstration in React Native
DESCRIPTION: This React Native application showcases the dynamic effects of various Flexbox layout properties such as flexDirection, justifyContent, alignItems, flexWrap, and direction. Users can interactively modify these properties using buttons and observe real-time changes in the arrangement of colored squares, providing a practical understanding of React Native's layout system.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.70/layout-props.md#_snippet_0

LANGUAGE: javascript
CODE:

```
import React, { useState } from 'react';
import { Button, ScrollView, StatusBar, StyleSheet, Text, View } from 'react-native';

const App = () => {
  const flexDirections = ['row', 'row-reverse', 'column', 'column-reverse'];
  const justifyContents = [
    'flex-start',
    'flex-end',
    'center',
    'space-between',
    'space-around',
    'space-evenly',
  ];
  const alignItemsArr = [
    'flex-start',
    'flex-end',
    'center',
    'stretch',
    'baseline',
  ];
  const wraps = ['nowrap', 'wrap', 'wrap-reverse'];
  const directions = ['inherit', 'ltr', 'rtl'];
  const [flexDirection, setFlexDirection] = useState(0);
  const [justifyContent, setJustifyContent] = useState(0);
  const [alignItems, setAlignItems] = useState(0);
  const [direction, setDirection] = useState(0);
  const [wrap, setWrap] = useState(0);

  const hookedStyles = {
    flexDirection: flexDirections[flexDirection],
    justifyContent: justifyContents[justifyContent],
    alignItems: alignItemsArr[alignItems],
    direction: directions[direction],
    flexWrap: wraps[wrap],
  };

  const changeSetting = (value, options, setterFunction) => {
    if (value == options.length - 1) {
      setterFunction(0);
      return;
    }
    setterFunction(value + 1);
  };
  const [squares, setSquares] = useState([<Square />, <Square />, <Square />]);
  return (
    <>
      <View style={{ paddingTop: StatusBar.currentHeight }} />
      <View style={[styles.container, styles.playingSpace, hookedStyles]}>
        {squares.map(elem => elem)}
      </View>
      <ScrollView style={[styles.container]}>
        <View style={[styles.controlSpace]}>
          <View style={styles.buttonView}>
            <Button
              title="Change Flex Direction"
              onPress={() =>
                changeSetting(flexDirection, flexDirections, setFlexDirection)
              }
            />
            <Text style={styles.text}>{flexDirections[flexDirection]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Justify Content"
              onPress={() =>
                changeSetting(
                  justifyContent,
                  justifyContents,
                  setJustifyContent
                )
              }
            />
            <Text style={styles.text}>{justifyContents[justifyContent]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Align Items"
              onPress={() =>
                changeSetting(alignItems, alignItemsArr, setAlignItems)
              }
            />
            <Text style={styles.text}>{alignItemsArr[alignItems]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Direction"
              onPress={() => changeSetting(direction, directions, setDirection)}
            />
            <Text style={styles.text}>{directions[direction]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Change Flex Wrap"
              onPress={() => changeSetting(wrap, wraps, setWrap)}
            />
            <Text style={styles.text}>{wraps[wrap]}</Text>
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Add Square"
              onPress={() => setSquares([...squares, <Square/>])}
            />
          </View>
          <View style={styles.buttonView}>
            <Button
              title="Delete Square"
              onPress={() =>
                setSquares(squares.filter((v, i) => i != squares.length - 1))
              }
            />
          </View>
        </View>
      </ScrollView>
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    height: '50%',
  },
  playingSpace: {
    backgroundColor: 'white',
    borderColor: 'blue',
    borderWidth: 3,
  },
  controlSpace: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    backgroundColor: '#F5F5F5',
  },
  buttonView: {
    width: '50%',
    padding: 10,
  },
  text: { textAlign: 'center' },
});

const Square = () => (
  <View style={{
    width: 50,
    height: 50,
    backgroundColor: randomHexColor(),
  }} />
);

const randomHexColor = () => {
  return '#000000'.replace(/0/g, () => {
    return (~~(Math.random() * 16)).toString(16);
  });
};

export default App;
```

---

TITLE: Installing Node and Watchman with Homebrew (Shell)
DESCRIPTION: This snippet demonstrates how to install Node.js and Watchman using Homebrew. Node.js is a JavaScript runtime essential for React Native, and Watchman is a file watching service by Facebook, highly recommended for performance. Homebrew is a package manager for macOS.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/_getting-started-macos-android.md#_snippet_0

LANGUAGE: shell
CODE:

```
brew install node
brew install watchman
```

---

TITLE: Applying Flex Property in React Native Layout (JavaScript)
DESCRIPTION: This snippet demonstrates how the `flex` property distributes available space among child components within a Flexbox container in React Native. The `flex` value determines the proportion of space each child occupies relative to the sum of all flex values of its siblings. It shows a container with `flexDirection: 'column'` and three child views with `flex: 1`, `flex: 2`, and `flex: 3` respectively, illustrating proportional space distribution.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.79/flexbox.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React from 'react';
import {StyleSheet, View} from 'react-native';

const Flex = () => {
  return (
    <View
      style={[
        styles.container,
        {
          // Try setting `flexDirection` to `"row"`.
          flexDirection: 'column',
        },
      ]}>
      <View style={{flex: 1, backgroundColor: 'red'}} />
      <View style={{flex: 2, backgroundColor: 'darkorange'}} />
      <View style={{flex: 3, backgroundColor: 'green'}} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
});

export default Flex;
```

---

TITLE: Enabling Native Modules Autolinking (App Build Gradle) - Gradle
DESCRIPTION: This Gradle snippet enables native module autolinking in the app's `build.gradle` file, completing the setup for automatic linking of native modules. It should be placed at the very bottom of the file to ensure all modules are correctly linked.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/_integration-with-existing-apps-java.md#_snippet_9

LANGUAGE: gradle
CODE:

```
apply from: file("../../node_modules/@react-native-community/cli-platform-android/native_modules.gradle"); applyNativeModulesAppBuildGradle(project)
```

---

TITLE: Implementing Text Input Translation with React Native
DESCRIPTION: This React Native component, `PizzaTranslator`, demonstrates how to handle text input using the `TextInput` component and React's `useState` hook. It captures user input via `onChangeText`, updates the component's state, and then displays a 'pizza' translation of the input, illustrating dynamic UI updates based on user interaction.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/handling-text-input.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import React, {useState} from 'react';
import {Text, TextInput, View} from 'react-native';

const PizzaTranslator = () => {
  const [text, setText] = useState('');
  return (
    <View style={{padding: 10}}>
      <TextInput
        style={{height: 40}}
        placeholder="Type here to translate!"
        onChangeText={newText => setText(newText)}
        defaultValue={text}
      />
      <Text style={{padding: 10, fontSize: 42}}>
        {text
          .split(' ')
          .map(word => word && '🍕')
          .join(' ')}
      </Text>
    </View>
  );
};

export default PizzaTranslator;
```

---

TITLE: Configuring TextInput for Forms in React Native (TypeScript)
DESCRIPTION: This TypeScript snippet provides an example of a multi-field form utilizing React Native's `TextInput` component, similar to the JavaScript version but with TypeScript type safety. It illustrates how to configure `TextInput` properties like `autoFocus`, `autoCapitalize`, `keyboardType`, `returnKeyType`, and `onSubmitEditing` for enhanced user experience. The form handles full name and email input, with the return key facilitating navigation and form submission.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.76/improvingux.md#_snippet_1

LANGUAGE: typescript
CODE:

```
import React, {useState, useRef} from 'react';
import {
  Alert,
  Text,
  StatusBar,
  TextInput,
  View,
  StyleSheet,
} from 'react-native';

const App = () => {
  const emailInput = useRef<TextInput>(null);
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');

  const submit = () => {
    Alert.alert(
      `Welcome, ${name}! Confirmation email has been sent to ${email}`,
    );
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      <View style={styles.header}>
        <Text style={styles.description}>
          This demo shows how using available TextInput customizations can make
          forms much easier to use. Try completing the form and notice that
          different fields have specific optimizations and the return key
          changes from focusing next input to submitting the form.
        </Text>
      </View>
      <TextInput
        style={styles.input}
        value={name}
        onChangeText={text => setName(text)}
        placeholder="Full Name"
        autoFocus={true}
        autoCapitalize="words"
        autoCorrect={true}
        keyboardType="default"
        returnKeyType="next"
        onSubmitEditing={() => emailInput.current?.focus()}
        blurOnSubmit={false}
      />
      <TextInput
        style={styles.input}
        value={email}
        onChangeText={text => setEmail(text)}
        ref={emailInput}
        placeholder="email@example.com"
        autoCapitalize="none"
        autoCorrect={false}
        keyboardType="email-address"
        returnKeyType="send"
        onSubmitEditing={submit}
        blurOnSubmit={true}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    paddingTop: 64,
    padding: 20,
    backgroundColor: '#282c34',
  },
  description: {
    fontSize: 14,
    color: 'white',
  },
  input: {
    margin: 20,
    marginBottom: 0,
    height: 34,
    paddingHorizontal: 10,
    borderRadius: 4,
    borderColor: '#ccc',
    borderWidth: 1,
    fontSize: 16,
  },
});

export default App;
```

---

TITLE: Registering a Component with AppRegistry (TypeScript)
DESCRIPTION: This method registers a React Native component as an entry point for the native system. It takes an `appKey` (string), a `ComponentProvider` function that returns the component, and an optional `section` boolean to categorize the component. It returns the registered `appKey`.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.72/appregistry.md#_snippet_7

LANGUAGE: tsx
CODE:

```
static registerComponent(
  appKey: string,
  getComponentFunc: ComponentProvider,
  section?: boolean,
): string;
```

---

TITLE: Applying Justify Content in React Native (JavaScript)
DESCRIPTION: This React Native component, `JustifyContentBasics`, demonstrates the usage of the `justifyContent` style property. It uses `useState` to dynamically change the `justifyContent` value, allowing users to interactively explore different alignment options like `flex-start`, `center`, and `space-between` for child `View` components within a container. The `PreviewLayout` component provides a UI for selecting these values and rendering the aligned boxes.
SOURCE: https://github.com/facebook/react-native-website/blob/main/website/versioned_docs/version-0.73/flexbox.md#_snippet_4

LANGUAGE: javascript
CODE:

```
import React, {useState} from 'react';
import {View, TouchableOpacity, Text, StyleSheet} from 'react-native';

const JustifyContentBasics = () => {
  const [justifyContent, setJustifyContent] = useState('flex-start');

  return (
    <PreviewLayout
      label="justifyContent"
      selectedValue={justifyContent}
      values={[
        'flex-start',
        'flex-end',
        'center',
        'space-between',
        'space-around',
        'space-evenly',
      ]}
      setSelectedValue={setJustifyContent}>
      <View style={[styles.box, {backgroundColor: 'powderblue'}]} />
      <View style={[styles.box, {backgroundColor: 'skyblue'}]} />
      <View style={[styles.box, {backgroundColor: 'steelblue'}]} />
    </PreviewLayout>
  );
};

const PreviewLayout = ({
  label,
  children,
  values,
  selectedValue,
  setSelectedValue,
}) => (
  <View style={{padding: 10, flex: 1}}>
    <Text style={styles.label}>{label}</Text>
    <View style={styles.row}>
      {values.map(value => (
        <TouchableOpacity
          key={value}
          onPress={() => setSelectedValue(value)}
          style={[styles.button, selectedValue === value && styles.selected]}>
          <Text
            style={[
              styles.buttonLabel,
              selectedValue === value && styles.selectedLabel,
            ]}>
            {value}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
    <View style={[styles.container, {[label]: selectedValue}]}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 8,
    backgroundColor: 'aliceblue',
  },
  box: {
    width: 50,
    height: 50,
  },
  row: {
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderRadius: 4,
    backgroundColor: 'oldlace',
    alignSelf: 'flex-start',
    marginHorizontal: '1%',
    marginBottom: 6,
    minWidth: '48%',
    textAlign: 'center',
  },
  selected: {
    backgroundColor: 'coral',
    borderWidth: 0,
  },
  buttonLabel: {
    fontSize: 12,
    fontWeight: '500',
    color: 'coral',
  },
  selectedLabel: {
    color: 'white',
  },
  label: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 24,
  },
});

export default JustifyContentBasics;
```
