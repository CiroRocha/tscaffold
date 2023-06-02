## tscaffold
Create an alias for this command and by running `tscaffold ComponentName` you should end up with a folder structure like this:

    ComponentName

      |_ ComponentName.styled.ts
  
      |_ ComponentName.test.tsx
  
      |_ ComponentName.tsx
  
      |_ index.tsx (only cotnains export { ComponentName as default } from './ComponentName.tsx')
