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

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Слушайте, жители Хориниса! По прямому указанию достопочтимого лорда Хагена, сегодня вступает в силу следующий декрет.
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //Учитывая общую ситуацию, леса и пустоши около города следует избегать ради вашей собственной же безопасности.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //Кроме того, любые контакты с восставшими крестьянами в прилежащих землях строжайше запрещены.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //С этого момента лорд Андрэ назначается главнокомандующим нашим ополчением.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //Все граждане этого города, имеющие военные навыки, обязаны вступить в королевское ополчение.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //Меры безопасности по защите верхнего квартала будут еще усилены.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //Охране у ворот приказано применять закон самым строжайшим образом, чтобы предотвратить несанкционированный доступ к кварталу.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //Во всех городах и провинциях королевства объявляется военное положение.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //Все гражданские судьи должны сложить свои обязанности и передать их королевским паладинам.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //Высокочтимому лорду Андрэ приказано карать любое преступление или акт сопротивления королевской страже самым жестоким образом.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //Все жители Хориниса, виновные в преступлении, должны немедленно прибыть к лорду Андрэ.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //Учитывая опасность нападения на город орков, все жители города должны соответствующим образом подготовиться.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //Все должны немедленно приступить к обучению боевым навыкам и должным образом вооружиться.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //Кузнец-наемник Беннет, вероломно убивший паладина Лотара, объявляется проклятым от имени Инноса.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //Он приговорен к смерти через повешение. Приговор будет приведен в исполнение в ближайшие дни.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //С кузнеца Беннета были сняты все обвинения вследствие его невиновности, которая была доказана советником лорда Хагена.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //Слухи о появлении драконов в Долине Рудников Хориниса являются ложными.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //Эти слухи распространяются врагом с целью посеять страх и ужас в душах мужественных жителей Миртаны.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //Чтобы развеять эти нелепые слухи, в Долину Рудников был отправлен отряд бравых паладинов под командованием человека, хорошо знакомого с этой местностью.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //Драконы, угрожавшие спокойствию нашей земли, были уничтожены мужественным воином под командованием лорда Хагена.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Скоро король Робар освободит наши земли от орков, и королевство опять станет цветущим и преуспевающим.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //Лорд Андрэ назначается верховным командующим города Хориниса. Он вступает в эту должность немедленно.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Лорд Хаген объявил, что лично направляется в Долину Рудников, чтобы обеспечить загрузку корабля магической рудой.
		};
	};
	AI_UseItemToState	(self,	Fakescroll,	-1);
};


/* 

			AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Hцrt Bьrger von Khorinis den BeschluЯ des ehrenwerten Lord Hagen!
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //An alle Bьrger von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //Hцrt ihr Bewohner von Khorinis und vernehmt das kцnigliche Dekret zur Aufrechterhaltung der цffentlichen Ordnung.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //An alle Bewohner von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 





Kapitel 3 Spieler kommt aus dem Minental und hat mit Lord Hagen gesprochen
Hцrt ihr Bьger von Khorinis. Ein Bote der Paladine brachte Kunde aus dem Minental
Unsere tapferen Paladine halten den Orks wehrhaft stand und erschliessen neue Minen fьr das Kцnigreich!

Kapitel 3 Bennet ist im Knast
Hцrt ihr Bьrger von Khorinis
Der Schmied Bennet, der den ehrenwerten Paladin Lothar heimtьckisch ermordert hat, ist im Namen Innos verurteilt worden. 
Das Urteil lautet Tod durch den Strick.

Kapitel 3 Bennet ist wieder frei
Hцrt ihr Bьrger,
Der Schmied Bennet wird freigesprochen, da seine Unschuld von einem klugen Berater Lord Hagens bewiesen wurde. 
So ist es Innos Wille und nach seiner Gerechtigkeit handeln wir. 
 
Kapitel 5 Start Drachen sind tot
Hцrt Bьrger von Khorinis
Die Drachen die das Land bedrohten wurden von tapferen Mдnnern unter dem Befehl von Lord Hagen besiegt.   
Bald wird auch Kцnig Rohbar das Land von den Orks befreien und das Kцnigreich wird in neuem Glanz aufblьhen!


Kapitel 5 Kurz vor SchluЯ (Spieler war in der Biblothek) 
Der ehrenwerte Lord Hagen hat verkьndet nun selbst ins Minental zu ziehen um dafьr zu sorgen das sein Schiff mit dem Erz beladen werden kann.  

*/
