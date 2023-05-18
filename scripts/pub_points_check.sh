threshold=50
dart pub global activate pana
pana --exit-code-threshold $threshold ../core
retVal=$?
if [ $retVal -eq 0 ]
then
  echo "Good pana score"
  exit 0
else
  echo "Pana score less than minimum"
  exit 1
fi