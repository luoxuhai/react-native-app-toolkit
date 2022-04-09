"use strict";(self.webpackChunkreact_native_app_toolkit_website=self.webpackChunkreact_native_app_toolkit_website||[]).push([[251],{3905:function(e,t,r){r.d(t,{Zo:function(){return s},kt:function(){return f}});var n=r(7294);function o(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function a(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function c(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?a(Object(r),!0).forEach((function(t){o(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):a(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function p(e,t){if(null==e)return{};var r,n,o=function(e,t){if(null==e)return{};var r,n,o={},a=Object.keys(e);for(n=0;n<a.length;n++)r=a[n],t.indexOf(r)>=0||(o[r]=e[r]);return o}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(n=0;n<a.length;n++)r=a[n],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(o[r]=e[r])}return o}var i=n.createContext({}),l=function(e){var t=n.useContext(i),r=t;return e&&(r="function"==typeof e?e(t):c(c({},t),e)),r},s=function(e){var t=l(e.components);return n.createElement(i.Provider,{value:t},e.children)},u={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},m=n.forwardRef((function(e,t){var r=e.components,o=e.mdxType,a=e.originalType,i=e.parentName,s=p(e,["components","mdxType","originalType","parentName"]),m=l(r),f=o,d=m["".concat(i,".").concat(f)]||m[f]||u[f]||a;return r?n.createElement(d,c(c({ref:t},s),{},{components:r})):n.createElement(d,c({ref:t},s))}));function f(e,t){var r=arguments,o=t&&t.mdxType;if("string"==typeof e||o){var a=r.length,c=new Array(a);c[0]=m;var p={};for(var i in t)hasOwnProperty.call(t,i)&&(p[i]=t[i]);p.originalType=e,p.mdxType="string"==typeof e?e:o,c[1]=p;for(var l=2;l<a;l++)c[l]=r[l];return n.createElement.apply(null,c)}return n.createElement.apply(null,r)}m.displayName="MDXCreateElement"},8486:function(e,t,r){r.r(t),r.d(t,{assets:function(){return s},contentTitle:function(){return i},default:function(){return f},frontMatter:function(){return p},metadata:function(){return l},toc:function(){return u}});var n=r(7462),o=r(3366),a=(r(7294),r(3905)),c=["components"],p={},i="setAppearanceColorScheme",l={unversionedId:"api/set-appearance-color-scheme",id:"api/set-appearance-color-scheme",title:"setAppearanceColorScheme",description:"Override the app's color scheme (light / dark / unspecified).",source:"@site/docs/api/set-appearance-color-scheme.md",sourceDirName:"api",slug:"/api/set-appearance-color-scheme",permalink:"/react-native-app-toolkit/docs/api/set-appearance-color-scheme",editUrl:"https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/docs/api/set-appearance-color-scheme.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"openDocumentCamera",permalink:"/react-native-app-toolkit/docs/api/open-document-camera"},next:{title:"Troubleshooting",permalink:"/react-native-app-toolkit/docs/troubleshooting"}},s={},u=[],m={toc:u};function f(e){var t=e.components,r=(0,o.Z)(e,c);return(0,a.kt)("wrapper",(0,n.Z)({},m,r,{components:t,mdxType:"MDXLayout"}),(0,a.kt)("h1",{id:"setappearancecolorscheme"},"setAppearanceColorScheme"),(0,a.kt)("p",null,"Override the app's color scheme (light / dark / unspecified)."),(0,a.kt)("pre",null,(0,a.kt)("code",{parentName:"pre",className:"language-typescript"},"import * as Toolkit from 'react-native-app-toolkit';\n\nToolkit.setAppearanceColorScheme('dark'); // 'dark' | 'light' | null\n")))}f.isMDXComponent=!0}}]);