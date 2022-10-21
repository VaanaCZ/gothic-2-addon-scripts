// ***************
// B_Announce_Herold 
// ***************

func void B_Announce_Herold ()
{
	var int randy;
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		B_TurnToNpc		(self,	hero);
	};
	
	// ------ NSC steckt ggf. Waffe weg ------
	AI_RemoveWeapon (self);
	
	CreateInvItem		(self,	Fakescroll);
	AI_UseItemToState	(self,	Fakescroll,	1);

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Abitanti di Khorinis, ascoltate! Per ordine esplicito dell'onorevole Lord Hagen, viene emanato il seguente decreto.
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //Vista la situazione, per il vostro bene, state alla larga da foreste e terre selvagge.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //Inoltre, è strettamente vietato qualsiasi contatto con i contadini ribelli nelle aree circostanti.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //Da questo momento in poi Lord Andre assumerà il comando della guardia cittadina.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //Tutti i cittadini in possesso di qualche abilità nelle armi sono invitati con urgenza a unirsi alla guardia cittadina del Re.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //Le misure di sicurezza per la protezione dei quartieri alti verranno ulteriormente rafforzate.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //Le guardie ai cancelli hanno l'ordine di applicare la legge alla lettera per impedire l'ingresso alle persone non autorizzate.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //A partire da ora, in tutte le città e le regioni del regno verrà proclamata la legge marziale.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //Tutti i giudici civili sono chiamati a cedere i loro incarichi ai paladini reali, con effetto immediato.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //L'onorevole Lord Andre ha l'ordine di punire ogni crimine o atto di resistenza contro le guardie reali con la massima severità.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //Tutti gli abitanti di Khorinis giudicati colpevoli di crimini vanno consegnati immediatamente a Lord Andre.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //A causa dell'imminente pericolo per un attacco degli orchi, ogni abitante della città deve preparasi all'evenienza in maniera opportuna.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //Tutti devono iniziare subito ad allenarsi nelle arti del combattimento e ad armarsi in maniera appropriata.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //Il fabbro mercenario Bennet, che ha ucciso a tradimento il paladino Lothar, è stato condannato a morte in nome di Innos.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //L'esecuzione avverrà per impiccagione e si svolgerà entro pochi giorni.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //Il fabbro Bennet è stato assolto dopo che un abile consigliere di Lord Hagen ha provato la sua innocenza.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //Le voci circa l'apparizione dei draghi nella Valle delle Miniere di Khorinis non sono fondate.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //Le voci sono state messe in giro dal nemico per diffondere paura e terrore nel coraggioso popolo di Myrtana.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //Per confutare le ridicole affermazioni, un gruppo di valorosi paladini è stato inviato nella Valle delle Miniere sotto la guida di una persona esperta del luogo.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //I draghi che minacciavano la regione sono stati sconfitti da un esercito di valorosi uomini guidato da Lord Hagen.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Presto re Rhobar libererà la regione dagli orchi e il regno fiorirà con rinnovato splendore.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //Lord Andre assumerà il comando supremo della città di Khorinis, con effetto immediato.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Lord Hagen ha reso noto che si recherà personalmente nella Valle delle Miniere per assicurarsi che il metallo magico venga caricato sulla sua nave.
		};
	};
	AI_UseItemToState	(self,	Fakescroll,	-1);
};


/* 

			AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Hört Bürger von Khorinis den Beschluß des ehrenwerten Lord Hagen!
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //An alle Bürger von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //Hört ihr Bewohner von Khorinis und vernehmt das königliche Dekret zur Aufrechterhaltung der öffentlichen Ordnung.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //An alle Bewohner von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 





Kapitel 3 Spieler kommt aus dem Minental und hat mit Lord Hagen gesprochen
Hört ihr Büger von Khorinis. Ein Bote der Paladine brachte Kunde aus dem Minental
Unsere tapferen Paladine halten den Orks wehrhaft stand und erschliessen neue Minen für das Königreich!

Kapitel 3 Bennet ist im Knast
Hört ihr Bürger von Khorinis
Der Schmied Bennet, der den ehrenwerten Paladin Lothar heimtückisch ermordert hat, ist im Namen Innos verurteilt worden. 
Das Urteil lautet Tod durch den Strick.

Kapitel 3 Bennet ist wieder frei
Hört ihr Bürger,
Der Schmied Bennet wird freigesprochen, da seine Unschuld von einem klugen Berater Lord Hagens bewiesen wurde. 
So ist es Innos Wille und nach seiner Gerechtigkeit handeln wir. 
 
Kapitel 5 Start Drachen sind tot
Hört Bürger von Khorinis
Die Drachen die das Land bedrohten wurden von tapferen Männern unter dem Befehl von Lord Hagen besiegt.   
Bald wird auch König Rohbar das Land von den Orks befreien und das Königreich wird in neuem Glanz aufblühen!


Kapitel 5 Kurz vor Schluß (Spieler war in der Biblothek) 
Der ehrenwerte Lord Hagen hat verkündet nun selbst ins Minental zu ziehen um dafür zu sorgen das sein Schiff mit dem Erz beladen werden kann.  

*/
