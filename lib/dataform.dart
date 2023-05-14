Map oneWayDocumentId = {
  'info': {
    'from': 'cairo',
    'to': 'ismailia',
    'num': '12',
    'parking': '6th October',
    'starting': '06:00 Am',
    'ends': '06:00 Pm',
    'deslocation': {'lat': 30.615367, 'long': 32.27083},
    'srclocation': {'lat': 29.973942, 'long': 30.989236}
  },
  'trips': {
    '1': {
      'no': '1',
      'reach': '09:00 Am',
      'tripping': '06:00 Am',
      'status': false,
      'curlocation': {'lat': 30.175733, 'long': 31.591364, 'online': true}
    },
    '2': {
      'no': '2',
      'reach': '11:00Am',
      'tripping': '08:00 Am',
      'status': true,
      'curlocation': {'lat': 0, 'long': 0, 'online': false}
    }
  }
};

Map roundDocumentId = {
  'info': {
    'from': 'cairo',
    'to': 'ismailia',
    'num': '12',
    'parkingF': '6th October',
    'parkingT': 'ismailia',
    'starting': '06:00 Am',
    'ends': '06:00 Pm',
    'deslocation': {'lat': 30.615367, 'long': 32.27083},
    'srclocation': {'lat': 29.973942, 'long': 30.989236}
  },
  'trips': {
    '1': {
      'no': '1',
      'reach': '09:00 Am',
      'tripping': '06:00 Am',
      'back': '09:00 Pm',
      'status': false,
      'curlocation': {'lat': 30.175733, 'long': 31.591364, 'online': true}
    },
    '2': {
      'no': '2',
      'reach': '11:00Am',
      'tripping': '08:00 Am',
      'status': true,
      'curlocation': {'lat': 0, 'long': 0, 'online': false}
    }
  }
};
