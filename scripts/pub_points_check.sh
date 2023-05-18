threshold=50
flutter pub add pana
pana --exit-code-threshold $threshold
retVal=$?
if [ $retVal -eq 0 ]
then
  echo "Good pana score"
  exit 0
else
  echo "Pana score less than minimum"
  exit 1
fi