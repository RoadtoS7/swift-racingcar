//
//  main.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

guard let carNames = InputView.inputCarNames(),
      let roundCount = InputView.inputRoundCount() else {
      OutputView.inputIsNil()
      exit(0)
}

do {
    let racingCars = try carNames.enumerated().compactMap({ index, carName in
        try RacingCarFactory.create(id:index, name:carName)
    })
    var racingGame = try RacingGame(racingCars: racingCars, roundCount: roundCount)
    let racingGameResult = racingGame.start()

    let winners = NormalRacingGameJudge().winner(of: racingGameResult)
    
    let formattedWinners = GameResultFormatter.format(winners)
    let formattedResult = GameResultFormatter.format(racingGameResult)
    gi
    OutputView.showWinners(formattedWinners)
    OutputView.showGameResult(formattedResult)
} catch(let error) {
    OutputView.printError(error)
}

