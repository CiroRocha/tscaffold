echo "Creating files for $1"

STYLED_COMPONENTS_FILENAME="$1.styled.ts"
TEST_FILENAME="$1.test.tsx"
COMPONENT_FILENAME="$1.tsx"
INDEX_FILENAME="index.tsx"

# Folder
mkdir $1
cd ./$1

# Styled components file
touch $STYLED_COMPONENTS_FILENAME
printf "import styled from 'styled-components'\r\n\r\n" >> $STYLED_COMPONENTS_FILENAME
printf "export const Container = styled.div\`\`\r\n" >> $STYLED_COMPONENTS_FILENAME
echo "Created styled components file"

# Test file
touch $TEST_FILENAME
printf "import $1 from '.'\r\n" >> $TEST_FILENAME
printf "import { RenderResult, fireEvent, render, screen } from '@testing-library/react'\r\n\r\n" >> $TEST_FILENAME
printf "const render$1 = (): RenderResult => {\r\n" >> $TEST_FILENAME
printf "  return render(<$1 />)\r\n\r\n" >> $TEST_FILENAME
printf "}\r\n\r\n" >> $TEST_FILENAME
printf "describe('', () => {\r\n" >> $TEST_FILENAME
printf "  it('should render correctly', () => {\r\n" >> $TEST_FILENAME
printf "    render$1()\r\n" >> $TEST_FILENAME
printf "    expect(/* YOUR CONDITION HERE */).toBeTruthy()\r\n" >> $TEST_FILENAME
printf "  })\r\n" >> $TEST_FILENAME
printf "})\r\n" >> $TEST_FILENAME
echo "Created test file"

# Component file
touch $COMPONENT_FILENAME
printf "import * as S from './$1.styled'\r\n\r\n" >> $COMPONENT_FILENAME
printf "interface ${1}Props {}\r\n\r\n" >> $COMPONENT_FILENAME
printf "export const $1 = ({}: ${1}Props): JSX.Element => {\r\n" >> $COMPONENT_FILENAME
printf "  return <S.Container>$1</S.Container>\r\n" >> $COMPONENT_FILENAME
printf "}\r\n" >> $COMPONENT_FILENAME
echo "Created component file"

# Index file
touch $INDEX_FILENAME
printf "export { $1 as default } from './$1'\r\n" >> $INDEX_FILENAME
echo "Created index file"

echo "✨  Done  ✨"
