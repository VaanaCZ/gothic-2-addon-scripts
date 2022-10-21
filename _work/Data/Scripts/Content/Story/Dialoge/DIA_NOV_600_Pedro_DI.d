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
//	Info Verr�ter
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
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //Zdrajco! Nareszcie ci� znalaz�em!

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //Nie my�l, �e ulituj� si� nad tob� tylko dlatego, �e jestem teraz jednym z paladyn�w.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Wielu najemnik�w zaprzeda�o dusze Beliarowi, ale mimo to czu�em skrupu�y, pozbawiaj�c ich �ycia. Ale ciebie, brudny wieprzu, zabij� z przyjemno�ci�!
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //Ze wszystkich bezdusznych szumowin, kt�re pozna�em w �yciu, ty jeste� najgorszy. Przynosisz ha�b� ca�emu zakonowi.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //Powinienem ci� zabi� na miejscu!
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //B�agam! Lito�ci! Rzucili na mnie urok! Nigdy nie zdradzi�bym klasztoru, gdyby nie oni!
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //Nie wyobra�asz sobie przez co przeszed�em w ci�gu ostatnich dni! S�ysza�em g�os w mojej g�owie! By�em bezradny!
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //Pu�kownik ork�w przes�uchiwa� mnie przez wiele dni. Bi� mnie i torturowa�. Zlituj si�! Jestem niewinny! Musisz mi uwierzy�!
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Zatem powiedz mi wszystko, co wiesz.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Nic nie musz�. Ju� po tobie...", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Daj mi jeden pow�d, dla kt�rego mia�bym ci da� wiar�.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes kaza� mi ci� zabi�...", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Daj mi jeden pow�d, dla kt�rego mia�bym ci da� wiar�.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //Daruj mi �ycie! Mog� ci powiedzie�, jak si� st�d wydosta�. Musisz mnie wys�ucha�!

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //Nic nie musz�. Ju� po tobie...
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //Na wszystkich bog�w...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes kaza� mi ci� zabi�, a ja zwykle wype�niam polecenia.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //Nie, b�agam! Nie mo�esz tego zrobi�! Mog� ci si� jeszcze przyda�!

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss hei�en; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Zatem powiedz mi wszystko, co wiesz.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //Tak, tak! Wszystko ci powiem. Ale pod jednym warunkiem! Musisz mi pom�c wydosta� si� z tej przekl�tej wyspy. Zgoda?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Nic nie musz�. Ju� po tobie...", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "W porz�dku. Chod� ze mn� - zabior� ci� na statek.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //W porz�dku. Chod� ze mn� - zabior� ci� na statek.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_FollowShip_09_01"); //Dzi�ki! Dzi�ki! Nie po�a�ujesz tego!
	
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

	description	= "Oto jeste�my.";	
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
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_00"); //Oto jeste�my.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //C� za wspania�y okr�t. Zaiste, jeste� wielkim dow�dc�.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //Daruj sobie. Teraz mo�emy porozmawia�.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Ach, jasne. Od czego mam zacz��?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Do�� us�ysza�em.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jak mog� si� dosta� w g��b wyspy?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jakie monstra mo�na jeszcze spotka� na tej wyspie?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Co z tym pu�kownikiem ork�w?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //Co z tym pu�kownikiem ork�w?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Odebra� mi ostatni� iskierk� nadziei na powr�t w ojczyste strony.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //Odk�d tu trafi�em, wypytywa� mnie o rozmieszczenie si� paladyn�w w Khorinis.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Oczywi�cie zbyt wiele si� ode mnie nie dowiedzia�. Sk�d niby mia�em wiedzie� takie rzeczy? Jestem zwyk�ym nowicjuszem!
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Pu�kownik ork�w nie �yje.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //Jakie monstra mo�na jeszcze spotka� na tej wyspie?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //W ci�gu dnia wybrze�e roi si� od jaszczuroludzi. Zwykle d�wigaj� ze sob� ogromne jaja.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Niewiele dociera�o do mojej celi, ale s�dz�, �e przygotowuj� si� do opuszczenia wyspy.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //Jak mog� si� dosta� w g��b wyspy?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //W sali tronowej orkowego pu�kownika jest tajemne przej�cie.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Zaci�gali mnie tam na ka�de przes�uchanie, st�d wiem o jego istnieniu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //Jeden z szaman�w uruchamia� mechanizm, poci�gaj�c za pochodnie na �cianach.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Hmmm... Wydaje mi si�, �e najpierw ci�gn�� za lew�, a potem za praw�, ale mog� si� myli�.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //W tylnej cz�ci sali otwiera�o si� przej�cie prowadz�ce w g��b g�ry.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //Dok�d dok�adnie - nie wiem.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //Pu�kownik ork�w nie �yje.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //Nie �yje? Chwa�a Innosowi. Nigdy nie zapomn� tej jego ohydnej g�by.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //Do�� ju� us�ysza�em. Poszukaj sobie jakiego� miejsca na statku. Mam jeszcze co� do za�atwienia.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Niech moc Innosa zawsze ci� chroni. B�d� si� za ciebie modli�.
	
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

	description	 = 	"Zm�czony?";
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
	AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_00"); //Zm�czony?

	if (Npc_GetDistToWP(self,"SHIP_DECK_05")<1000) 
	{	
		if (PedroDI_Flee == LOG_RUNNING)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //Mo�e ci przynie�� poduszk�, co?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //Nie drwij ze mnie. B�d� tu sobie siedzia� cichutko jak myszka.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Mmmh.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Jestem zupe�nie wyczerpany.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //Walnij si� na ��ko. Wkr�tce wyp�ywamy.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //Dzi�ki. My�la�em, �e zaraz zlec� z tej �awy. Dobranoc.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //W porz�dku. Dzi�ki.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //B�agam! Daruj mi �ycie!
		AI_StopProcessInfos (self);
	};
};

