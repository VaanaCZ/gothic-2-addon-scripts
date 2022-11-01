///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_DI_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro_DI;
	nr          = 999;
	condition   = DIA_Pedro_DI_EXIT_Condition;
	information = DIA_Pedro_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verräter
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_YOU		(C_INFO)
{
	npc			 = 	NOV_600_Pedro_DI;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_DI_YOU_Condition;
	information	 = 	DIA_Pedro_DI_YOU_Info;
	
	description	 = 	"Zdrajca!";
	
};
func int DIA_Pedro_DI_YOU_Condition ()
{	
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //Zdrajco! Nareszcie cię znalazłem!

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //Nie myśl, że ulituję się nad tobą tylko dlatego, że jestem teraz jednym z paladynów.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Wielu najemników zaprzedało dusze Beliarowi, ale mimo to czułem skrupuły, pozbawiając ich życia. Ale ciebie, brudny wieprzu, zabiję z przyjemnością!
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //Ze wszystkich bezdusznych szumowin, które poznałem w życiu, ty jesteś najgorszy. Przynosisz hańbę całemu zakonowi.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //Powinienem cię zabić na miejscu!
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //Błagam! Litości! Rzucili na mnie urok! Nigdy nie zdradziłbym klasztoru, gdyby nie oni!
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //Nie wyobrażasz sobie przez co przeszedłem w ciągu ostatnich dni! Słyszałem głos w mojej głowie! Byłem bezradny!
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //Pułkownik orków przesłuchiwał mnie przez wiele dni. Bił mnie i torturował. Zlituj się! Jestem niewinny! Musisz mi uwierzyć!
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Zatem powiedz mi wszystko, co wiesz.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Nic nie muszę. Już po tobie...", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Daj mi jeden powód, dla którego miałbym ci dać wiarę.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes kazał mi cię zabić...", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Daj mi jeden powód, dla którego miałbym ci dać wiarę.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //Daruj mi życie! Mogę ci powiedzieć, jak się stąd wydostać. Musisz mnie wysłuchać!

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //Nic nie muszę. Już po tobie...
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //Na wszystkich bogów...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes kazał mi cię zabić, a ja zwykle wypełniam polecenia.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //Nie, błagam! Nie możesz tego zrobić! Mogę ci się jeszcze przydać!

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss heißen; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Zatem powiedz mi wszystko, co wiesz.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //Tak, tak! Wszystko ci powiem. Ale pod jednym warunkiem! Musisz mi pomóc wydostać się z tej przeklętej wyspy. Zgoda?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Nic nie muszę. Już po tobie...", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "W porządku. Chodź ze mną - zabiorę cię na statek.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //W porządku. Chodź ze mną - zabiorę cię na statek.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_FollowShip_09_01"); //Dzięki! Dzięki! Nie pożałujesz tego!
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_Pedro_DI_FollowShip = LOG_RUNNING;

};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedAtShip
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_ArrivedAtShip		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	4;
	condition	 = 	DIA_Pedro_DI_ArrivedAtShip_Condition;
	information	 = 	DIA_Pedro_DI_ArrivedAtShip_Info;

	description	= "Oto jesteśmy.";	
};

func int DIA_Pedro_DI_ArrivedAtShip_Condition ()
{
	if (Npc_GetDistToWP(self,"SHIP")<6000) 
	&& (MIS_Pedro_DI_FollowShip == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_00"); //Oto jesteśmy.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //Cóż za wspaniały okręt. Zaiste, jesteś wielkim dowódcą.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //Daruj sobie. Teraz możemy porozmawiać.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Ach, jasne. Od czego mam zacząć?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Dość usłyszałem.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jak mogę się dostać w głąb wyspy?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jakie monstra można jeszcze spotkać na tej wyspie?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Co z tym pułkownikiem orków?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //Co z tym pułkownikiem orków?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Odebrał mi ostatnią iskierkę nadziei na powrót w ojczyste strony.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //Odkąd tu trafiłem, wypytywał mnie o rozmieszczenie sił paladynów w Khorinis.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Oczywiście zbyt wiele się ode mnie nie dowiedział. Skąd niby miałem wiedzieć takie rzeczy? Jestem zwykłym nowicjuszem!
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Pułkownik orków nie żyje.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //Jakie monstra można jeszcze spotkać na tej wyspie?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //W ciągu dnia wybrzeże roi się od jaszczuroludzi. Zwykle dźwigają ze sobą ogromne jaja.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Niewiele docierało do mojej celi, ale sądzę, że przygotowują się do opuszczenia wyspy.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //Jak mogę się dostać w głąb wyspy?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //W sali tronowej orkowego pułkownika jest tajemne przejście.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Zaciągali mnie tam na każde przesłuchanie, stąd wiem o jego istnieniu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //Jeden z szamanów uruchamiał mechanizm, pociągając za pochodnie na ścianach.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Hmmm... Wydaje mi się, że najpierw ciągnął za lewą, a potem za prawą, ale mogę się mylić.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //W tylnej części sali otwierało się przejście prowadzące w głąb góry.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //Dokąd dokładnie - nie wiem.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //Pułkownik orków nie żyje.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //Nie żyje? Chwała Innosowi. Nigdy nie zapomnę tej jego ohydnej gęby.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //Dość już usłyszałem. Poszukaj sobie jakiegoś miejsca na statku. Mam jeszcze coś do załatwienia.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Niech moc Innosa zawsze cię chroni. Będę się za ciebie modlił.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_PERM		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	5;
	condition	 = 	DIA_Pedro_DI_PERM_Condition;
	information	 = 	DIA_Pedro_DI_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Zmęczony?";
};
var int PedroDI_TalkNomore;
func int DIA_Pedro_DI_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
	&& (PedroDI_TalkNomore == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Pedro_DI_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_00"); //Zmęczony?

	if (Npc_GetDistToWP(self,"SHIP_DECK_05")<1000) 
	{	
		if (PedroDI_Flee == LOG_RUNNING)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //Może ci przynieść poduszkę, co?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //Nie drwij ze mnie. Będę tu sobie siedział cichutko jak myszka.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Mmmh.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Jestem zupełnie wyczerpany.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //Walnij się na łóżko. Wkrótce wypływamy.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //Dzięki. Myślałem, że zaraz zlecę z tej ławy. Dobranoc.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //W porządku. Dzięki.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //Błagam! Daruj mi życie!
		AI_StopProcessInfos (self);
	};
};

