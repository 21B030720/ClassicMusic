//
//  Data.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 04.08.2023.
//

import Foundation

let Profile = [
    "name": "Arslan",
    "image": "image"
]

struct Title {
    let name: String
    let imageName: String
}

struct Article {
    let imageName: String
    let text: String
}

let titles = [
    ["Beethoven.jpg", "Beethoven", "Ludwig van Beethoven[n 1] (baptised 17 December 1770 – 26 March 1827) was a German composer and pianist. Beethoven remains one of the most admired composers in the history of Western music; his works rank among the most performed of the classical music repertoire and span the transition from the Classical period to the Romantic era in classical music. His career has conventionally been divided into early, middle, and late periods. His early period, during which he forged his craft, is typically considered to have lasted until 1802. From 1802 to around 1812, his middle period showed an individual development from the styles of Joseph Haydn and Wolfgang Amadeus Mozart, and is sometimes characterized as heroic. During this time, he began to grow increasingly deaf. In his late period, from 1812 to 1827, he extended his innovations in musical form and expression. Beethoven was not even 30 years old when he realised that his hearing ability started to decrease. This process would continue until he became completely deaf. A tragedy for a composer. We have reconstructed this process electronically. By listening to Beethoven's music the way the composer heard it, you can experience Beethoven's dwindling hearing ability. Statements from Beethoven and some of his contemporaries as well as short medical explanations complement this vivid reconstruction and give an example of how Beethoven must have lived through this tragic time and how other people might have perceived him.I would rather write 10000 notes than a single letter of the alphabet\", so Ludwig van Beethoven admitted to his Bonn friend and musical editor Nikolaus Simrock (in a letter from November 28, 1820), still he was forced to make written utterances all the time. Beethoven's letters alone contain far more than 100,000 letters of the alphabet written with his quill. Some statements have become quite famous and even popular sayings."],
    ["Paganini.jpg", "Paganini", "Niccolò Paganini was born in Genoa (then capital of the Republic of Genoa) on 27 October 1782, the third of the six children of Antonio and Teresa (née Bocciardo) Paganini.[1]: 11  Antonio Paganini was an unsuccessful ship chandler,[2] but he managed to supplement his income by working as a musician and by selling mandolins.[1]: 11  At the age of five, Paganini started learning the mandolin from his father and moved to the violin by the age of seven. His musical talents were quickly recognized, earning him numerous scholarships for violin lessons. The young Paganini studied under various local violinists, including Giovanni Servetto and Giacomo Costa, but his progress quickly outpaced their abilities. Paganini and his father then traveled to Parma to seek further guidance from Alessandro Rolla. But upon listening to Paganini's playing, Rolla immediately referred him to his own teacher, Ferdinando Paer and, later, Paer's own teacher, Gasparo Ghiretti. Though Paganini did not stay long with Paer or Ghiretti, the two had considerable influence on his compositional style."],
    ["Tchaikovsky.jpg", "Tchaikovsky", "Pyotr Ilyich Tchaikovsky[n 2] (/tʃaɪˈkɒfski/ chy-KOF-skee;[2] 7 May 1840 – 6 November 1893)[n 3] was a Russian composer of the Romantic period. He was the first Russian composer whose music would make a lasting impression internationally. Tchaikovsky wrote some of the most popular concert and theatrical music in the current classical repertoire, including the ballets Swan Lake and The Nutcracker, the 1812 Overture, his First Piano Concerto, Violin Concerto, the Romeo and Juliet Overture-Fantasy, several symphonies, and the opera Eugene Onegin."],
    ["Tchaikovsky.jpg", "Tchaikovsky", "Pyotr Ilyich Tchaikovsky[n 2] (/tʃaɪˈkɒfski/ chy-KOF-skee;[2] 7 May 1840 – 6 November 1893)[n 3] was a Russian composer of the Romantic period. He was the first Russian composer whose music would make a lasting impression internationally. Tchaikovsky wrote some of the most popular concert and theatrical music in the current classical repertoire, including the ballets Swan Lake and The Nutcracker, the 1812 Overture, his First Piano Concerto, Violin Concerto, the Romeo and Juliet Overture-Fantasy, several symphonies, and the opera Eugene Onegin."],
    ["Tchaikovsky.jpg", "Tchaikovsky", "Pyotr Ilyich Tchaikovsky[n 2] (/tʃaɪˈkɒfski/ chy-KOF-skee;[2] 7 May 1840 – 6 November 1893)[n 3] was a Russian composer of the Romantic period. He was the first Russian composer whose music would make a lasting impression internationally. Tchaikovsky wrote some of the most popular concert and theatrical music in the current classical repertoire, including the ballets Swan Lake and The Nutcracker, the 1812 Overture, his First Piano Concerto, Violin Concerto, the Romeo and Juliet Overture-Fantasy, several symphonies, and the opera Eugene Onegin."],
    ["Tchaikovsky.jpg", "Tchaikovsky", "Pyotr Ilyich Tchaikovsky[n 2] (/tʃaɪˈkɒfski/ chy-KOF-skee;[2] 7 May 1840 – 6 November 1893)[n 3] was a Russian composer of the Romantic period. He was the first Russian composer whose music would make a lasting impression internationally. Tchaikovsky wrote some of the most popular concert and theatrical music in the current classical repertoire, including the ballets Swan Lake and The Nutcracker, the 1812 Overture, his First Piano Concerto, Violin Concerto, the Romeo and Juliet Overture-Fantasy, several symphonies, and the opera Eugene Onegin."],
    ["Tchaikovsky.jpg", "Tchaikovsky", "Pyotr Ilyich Tchaikovsky[n 2] (/tʃaɪˈkɒfski/ chy-KOF-skee;[2] 7 May 1840 – 6 November 1893)[n 3] was a Russian composer of the Romantic period. He was the first Russian composer whose music would make a lasting impression internationally. Tchaikovsky wrote some of the most popular concert and theatrical music in the current classical repertoire, including the ballets Swan Lake and The Nutcracker, the 1812 Overture, his First Piano Concerto, Violin Concerto, the Romeo and Juliet Overture-Fantasy, several symphonies, and the opera Eugene Onegin."],
    ["Tchaikovsky.jpg", "Tchaikovsky", "Pyotr Ilyich Tchaikovsky[n 2] (/tʃaɪˈkɒfski/ chy-KOF-skee;[2] 7 May 1840 – 6 November 1893)[n 3] was a Russian composer of the Romantic period. He was the first Russian composer whose music would make a lasting impression internationally. Tchaikovsky wrote some of the most popular concert and theatrical music in the current classical repertoire, including the ballets Swan Lake and The Nutcracker, the 1812 Overture, his First Piano Concerto, Violin Concerto, the Romeo and Juliet Overture-Fantasy, several symphonies, and the opera Eugene Onegin."],
    ["Tchaikovsky.jpg", "Tchaikovsky", "Pyotr Ilyich Tchaikovsky[n 2] (/tʃaɪˈkɒfski/ chy-KOF-skee;[2] 7 May 1840 – 6 November 1893)[n 3] was a Russian composer of the Romantic period. He was the first Russian composer whose music would make a lasting impression internationally. Tchaikovsky wrote some of the most popular concert and theatrical music in the current classical repertoire, including the ballets Swan Lake and The Nutcracker, the 1812 Overture, his First Piano Concerto, Violin Concerto, the Romeo and Juliet Overture-Fantasy, several symphonies, and the opera Eugene Onegin."]
    
]

class Data {
    
}