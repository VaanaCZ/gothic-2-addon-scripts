// ***************************************************************
//								EXIT
// ***************************************************************

// ---------------------
	var int Lothar_ImOV;
// ---------------------

INSTANCE DIA_Lothar_EXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_EXIT_Condition;
	information = DIA_Lothar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lothar_EXIT_Condition()
{	
	if (Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_EXIT_Info() 
{
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							First EXIT
// ***************************************************************

INSTANCE DIA_Lothar_FirstEXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_FirstEXIT_Condition;
	information = DIA_Lothar_FirstEXIT_Info;
	permanent   = TRUE;
	description = "Muszê iœæ! (KONIEC)";
};
FUNC INT DIA_Lothar_FirstEXIT_Condition()
{	
	if (Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_FirstEXIT_Info() 
{
	AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_00"); //Muszê iœæ!
	if (Lothar_Regeln == FALSE)
	{
		AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_01"); //Zaczekaj! Nie znasz nowych przepisów obowi¹zuj¹cych w mieœcie!
		AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_02"); //Na razie.
	}
	else
	{
		if (Player_TalkedAboutDragons == TRUE)
		&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_03"); //Jeœli jeszcze raz us³yszê, ¿e opowiadasz mieszkañcom tego miasta jakieœ brednie o smokach, wpadniesz w tarapaty, rozumiemy siê?
		}
		else
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_04"); //Dopóki przebywasz w Khorinis, mo¿esz siê czuæ bezpieczny.

			if (hero.guild != GIL_PAL)
			{
				AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_05"); //Porz¹dku w mieœcie strzeg¹ teraz królewscy paladyni!
			};
		};

		Lothar_ImOV = TRUE;
		Npc_ExchangeRoutine (self, "START");
	};

	// ------- Canthars TA auswechseln -------
	if (Canthar_InStadt == FALSE)
	{
		Npc_ExchangeRoutine (Canthar, "START");
		Canthar_InStadt = TRUE;
	};

	AI_StopProcessInfos (self);
};


// ***************************************************************
//							Hallo
// ***************************************************************

instance DIA_Lothar_Hallo (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Hallo_Condition;
	information	 = 	DIA_Lothar_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Lothar_Hallo_Condition ()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lothar_Hallo_01_00"); //Stój, nieznajomy!

	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Hallo_01_01"); //Nie widzia³em, ¿ebyœ przechodzi³ przez tê bramê.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_02"); //I co w zwi¹zku z tym?
		AI_Output (self, other, "DIA_Lothar_Hallo_01_03"); //A stra¿nicy strzeg¹cy drugiej bramy maj¹ zakaz wpuszczania kogokolwiek do miasta.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_04"); //Eeem...
		AI_Output (self, other, "DIA_Lothar_Hallo_01_05"); //Bêdê musia³ siê rozmówiæ z tymi obwiesiami!
		AI_Output (self, other, "DIA_Lothar_Hallo_01_06"); //Pozwól, ¿e siê przedstawiê:
	};

	AI_Output (self, other, "DIA_Lothar_Hallo_01_07"); //Jestem Lothar, królewski paladyn i skromny s³uga naszego Pana, Innosa.
	AI_Output (self, other, "DIA_Lothar_Hallo_01_08"); //Nasz dowódca, Lord Hagen, powierzy³ mi zadanie informowania wszystkich przybyszy o nowych prawach obowi¹zuj¹cych w mieœcie.

	//ADDON>
	AI_Output (self, other, "DIA_Addon_Lothar_Hallo_01_00"); //Mieszkañcy miasta znikaj¹ bez œladu, wiêc wszyscy musz¹ przestrzegaæ ustalonych zasad - o ile nie chc¹, aby to samo spotka³o tak¿e ich.
	//ADDON<

	if Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	{
		B_StartOtherRoutine (Lester, "XARDAS");
	};
};

// ***************************************************************
//						Wichtige Nachricht			E1
// ***************************************************************
instance DIA_Lothar_MESSAGE		(C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_MESSAGE_Condition;
	information	 = 	DIA_Lothar_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"Mam wa¿n¹ wiadomoœæ dla przywódcy paladynów!";
};
func int DIA_Lothar_MESSAGE_Condition ()
{	
	if (Mil_305_schonmalreingelassen == FALSE) 
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_MESSAGE_Info ()
{
 	AI_Output (other, self, "DIA_Lothar_MESSAGE_15_00"); //Mam wa¿n¹ wiadomoœæ dla przywódcy paladynów!
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_01"); //Wielmo¿ny Lord Hagen nikogo nie przyjmuje.
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_02"); //Wszelkimi sprawami pospólstwa zajmuje siê Lord Andre, dowódca stra¿y miejskiej.
};	

// ***************************************************************
//							Auge Innos 				E2
// ***************************************************************
instance DIA_Lothar_EyeInnos (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_EyeInnos_Condition;
	information	 = 	DIA_Lothar_EyeInnos_Info;
	permanent    =  FALSE;
	description	 = 	"Przybywam, aby zdobyæ Oko Innosa!";
};
func int DIA_Lothar_EyeInnos_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_EyeInnos_Info ()
{
	AI_Output (other, self, "DIA_Lothar_EyeInnos_15_00"); //Przybywam, aby zdobyæ Oko Innosa!

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_01"); //To sprawa Lorda Hagena i z nim powinieneœ na ten temat rozmawiaæ.
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_02"); //Œwiête Oko Innosa! Sk¹d o nim wiesz?! Nie nale¿ysz do zakonu!
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_03"); //Powiedzia³ mi o nim pewien mag.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_04"); //Nie wiem, jakimi motywami móg³ siê kierowaæ, powierzaj¹c ci jeden z sekretów naszego zakonu.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_05"); //Z pewnoœci¹ nie chodzi³o mu o to, abyœ po³o¿y³ swoje brudne ³apska na naszej œwiêtej relikwii.
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_06"); //Ale...
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_07"); //Nie chcê wiêcej o tym s³yszeæ!
		if (Player_TalkedAboutDragons == TRUE)
		{
			AI_Output (self, other, "DIA_Lothar_EyeInnos_01_08"); //Najpierw te opowieœci o smokach, a teraz jeszcze coœ takiego - to oburzaj¹ce!
		};
	};
};	

// ***************************************************************
//							Drachen 				E2
// ***************************************************************
instance DIA_Lothar_Dragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Dragons_Condition;
	information	 = 	DIA_Lothar_Dragons_Info;
	permanent    =  FALSE;
	description	 = 	"Pos³uchaj - miastu zagra¿aj¹ smoki!";
};
func int DIA_Lothar_Dragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Dragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Dragons_15_00"); //Pos³uchaj - miastu zagra¿aj¹ smoki!
	if ((hero.guild != GIL_PAL)&&(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_01"); //To niemo¿liwe!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_02"); //Kolejny szaleniec!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_03"); //I tak ju¿ mamy w mieœcie wystarczaj¹co du¿o problemów. Nawet bez jakiegoœ nawiedzonego dziwaka, strasz¹cego obywateli niestworzonymi historiami o smokach!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_04"); //Ostatnia osoba, która opowiada³a tutaj historie o smokach, zosta³a przeze mnie aresztowana i wys³ana wraz z reszt¹ wiêŸniów do Górniczej Doliny. Wiêc lepiej uwa¿aj, co mówisz!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_05"); //Nie mo¿emy pozwoliæ, aby ktoœ sia³ panikê wœród naszych obywateli!
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_06"); //Ju¿ o tym s³ysza³em. Jednak trudno mi w to uwierzyæ.
		AI_Output (self, other, "DIA_Lothar_Dragons_01_07"); //By³oby lepiej, gdybyœ zachowa³ tê wiedzê dla siebie. Musimy zapobiegaæ wybuchowi paniki.
	};
	Player_TalkedAboutDragons = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_Ornament		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lothar_Ornament_Condition;
	information	 = 	DIA_Addon_Lothar_Ornament_Info;

	description	 = 	"Wiesz mo¿e coœ o kamieniu z kamiennego krêgu przy farmie Lobarta?";
};

func int DIA_Addon_Lothar_Ornament_Condition ()
{
	if (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_Ornament_15_00"); //Wiesz mo¿e coœ o kamieniu z kamiennego krêgu przy farmie Lobarta?
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_01"); //Oczywiœcie. Zniszczyliœmy go - zagra¿a³ okolicznym w³oœcianom.
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_02"); //Czemu pytasz?
	
	Info_ClearChoices	(DIA_Addon_Lothar_Ornament);
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Szukam metalowej czêœci ornamentu w kszta³cie pierœcienia.", DIA_Addon_Lothar_Ornament_suche );
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "S¹dzisz, ¿e to normalne?", DIA_Addon_Lothar_Ornament_normal );
};
func void DIA_Addon_Lothar_Ornament_normal ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_00"); //S¹dzisz, ¿e to normalne?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_01"); //Chodzi ci o tego kamiennego potwora?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_02"); //O ile mi wiadomo, to t¹ spraw¹ zajmuj¹ siê Magowie Wody.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_03"); //Nie chcê siê tym wiêcej przejmowaæ - mamy doœæ swojej roboty w mieœcie i Górniczej Dolinie.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_04"); //Dobrze.
};

func void DIA_Addon_Lothar_Ornament_suche ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_00"); //Szukam metalowej czêœci ornamentu w kszta³cie pierœcienia.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_01"); //Powinien znajdowaæ siê gdzieœ w pobli¿u kamiennego krêgu Lobarta.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_02"); //Tak, by³o tam coœ takiego - kamienny stwór mia³ to przy sobie. S¹dzi³em, ¿e to magiczna runa.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_03"); //Przekaza³em j¹ Lordowi Hagenowi, ale nie wiem, czy nadal j¹ ma.
};

// ***************************************************************
//							WerVonDrachen 				E3
// ***************************************************************
instance DIA_Lothar_WhoDragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_WhoDragons_Condition;
	information	 = 	DIA_Lothar_WhoDragons_Info;
	permanent    =  FALSE;
	description	 = 	"Czy ktoœ ju¿ ostrzega³ was o zagro¿eniu ze strony smoków?";
};
func int DIA_Lothar_WhoDragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Dragons))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WhoDragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WhoDragons_15_00"); //Czy ktoœ ju¿ ostrzega³ was o zagro¿eniu ze strony smoków?
	AI_Output (self, other, "DIA_Lothar_WhoDragons_01_01"); //Tak. Nazywa³ siê Diego. Przynajmniej tak mi siê wydaje.

	if ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_WhoDragons_01_02"); //Ostrzega³em go - tak jak ciebie! Ale ten szaleniec nie chcia³ mnie w ogóle s³uchaæ!
	};
};	

// ***************************************************************
//							Regeln 				E1
// ***************************************************************
instance DIA_Lothar_Regeln (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_Regeln_Condition;
	information	 = 	DIA_Lothar_Regeln_Info;
	permanent    =  FALSE;
	description	 = 	"Opowiedz mi o przepisach obowi¹zuj¹cych w mieœcie!";
};
func int DIA_Lothar_Regeln_Condition ()
{	
	return TRUE;
};
func void DIA_Lothar_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Regeln_15_00"); //No dobrze - opowiedz mi o przepisach panuj¹cych w mieœcie!
	AI_Output (self, other, "DIA_Lothar_Regeln_01_01"); //Po pierwsze: dostojny paladyn Lord Hagen rezyduje w górnym mieœcie, wraz ze swoimi wojskami.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_02"); //Dlatego jedynie powa¿ani obywatele mog¹ tam wchodziæ.
	AI_Output (self ,other, "DIA_Lothar_Add_01_04"); //Po drugie: ratusz w górnym mieœcie zosta³ przejêty przez paladynów, którzy za³o¿yli tam swoj¹ g³ówn¹ siedzibê. Tylko paladyni i cz³onkowie stra¿y mog¹ wchodziæ do œrodka.
	AI_Output (self ,other, "DIA_Lothar_Add_01_05"); //Po trzecie: ktokolwiek zostanie oskar¿ony o pope³nienie przestêpstwa, musi siê oczyœciæ z zarzutów przed dowódc¹ stra¿y.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_05"); //Jakieœ pytania?
	
	Lothar_Regeln = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_MissingPeople		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lothar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Lothar_MissingPeople_Info;

	description	 = 	"Mieszkañcy miasta tak po prostu znikaj¹?";
};

func int DIA_Addon_Lothar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lothar_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_MissingPeople_15_00"); //Mieszkañcy miasta tak po prostu znikaj¹?
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_01"); //Tak. Z dnia na dzieñ jest coraz wiêcej zg³oszeñ.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_02"); //Stra¿ nie zdo³a³a rozwi¹zaæ zagadki tych dziwnych zdarzeñ.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_03"); //Nic wiêc dziwnego, ¿e ludnoœæ miasta zachowuje siê nieufnie w stosunku do obcych.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_04"); //Bêd¹c w mieœcie, staraj siê nie zwracaæ na siebie uwagi.
	
		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
		};
	
	SC_HearedAboutMissingPeople = TRUE;
};

// ***************************************************************
//							HowCitizen 				E2
// ***************************************************************
instance DIA_Lothar_HowCitizen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	4;
	condition	 = 	DIA_Lothar_HowCitizen_Condition;
	information	 = 	DIA_Lothar_HowCitizen_Info;
	permanent    =  FALSE;
	description	 = 	"Jak mogê zostaæ obywatelem miasta?";
};
func int DIA_Lothar_HowCitizen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_HowCitizen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_06"); //Jak mogê zostaæ obywatelem miasta?
	AI_Output (self ,other, "DIA_Lothar_Add_01_07"); //Obywatelem miasta mo¿e byæ jedynie osoba posiadaj¹ca sta³e zatrudnienie!
	AI_Output (self ,other, "DIA_Lothar_Add_01_09"); //Nie myœl jednak, ¿e zostaniesz dopuszczony do Lorda Hagena tylko dlatego, ¿e jesteœ obywatelem Khorinis!
	AI_Output (self ,other, "DIA_Lothar_Add_01_10"); //Obywatelstwo daje ci prawo wstêpu do górnego miasta - nic wiêcej!
	AI_Output (self ,other, "DIA_Lothar_Add_01_11"); //Tylko cz³onkowie stra¿y maj¹ wstêp do ratusza miejskiego!
};

// ***************************************************************
//							WoArbeit				E3
// ***************************************************************
instance DIA_Lothar_WoArbeit (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	5;
	condition	 = 	DIA_Lothar_WoArbeit_Condition;
	information	 = 	DIA_Lothar_WoArbeit_Info;
	permanent    =  FALSE;
	description	 = 	"Gdzie mogê znaleŸæ pracê?";
};
func int DIA_Lothar_WoArbeit_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_HowCitizen))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoArbeit_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_14"); //Gdzie mogê znaleŸæ pracê?
	AI_Output (self ,other, "DIA_Lothar_Add_01_15"); //Musisz zostaæ czeladnikiem u jednego z mistrzów rezyduj¹cych w dolnej czêœci miasta.
	AI_Output (self ,other, "DIA_Lothar_Add_01_16"); //Jeœli zostaniesz przyjêty na praktykê, automatycznie staniesz siê obywatelem miasta.
	AI_Output (self ,other, "DIA_Lothar_Add_01_17"); //Jednak wedle pradawnej tradycji, musz¹ siê na to zgodziæ pozostali mistrzowie.
	AI_Output (self ,other, "DIA_Lothar_Add_01_18"); //Jeœli chcia³eœ szukaæ pracy w dzielnicy portowej - zapomnij o tym!
	AI_Output (self ,other, "DIA_Lothar_Add_01_19"); //Mieszkaj¹ tam same najgorsze œmiecie. Najlepiej w ogóle unikaæ tego miejsca!
};

// ***************************************************************
//							ToOV 				E2
// ***************************************************************
instance DIA_Lothar_ToOV (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	6;
	condition	 = 	DIA_Lothar_ToOV_Condition;
	information	 = 	DIA_Lothar_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"Jak dojœæ do górnego miasta?";
};
func int DIA_Lothar_ToOV_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Lothar_Regeln))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToOV_Info ()
{
	AI_Output (other, self, "DIA_Lothar_ToOV_15_00"); //Jak dojœæ do górnego miasta?
	AI_Output (self, other, "DIA_Lothar_ToOV_01_01"); //Czy ty mnie w ogóle s³uchasz?!
	AI_Output (self, other, "DIA_Lothar_ToOV_01_02"); //Nie jesteœ obywatelem tego miasta. Mo¿esz wiêc sobie oszczêdziæ wysi³ku - stra¿nicy i tak ciê nie wpuszcz¹.
	AI_Output (self, other, "DIA_Lothar_ToOV_01_03"); //Nie masz szans na przedostanie siê za bramê!
};	

// ***************************************************************
//							ToMiliz 				E2
// ***************************************************************
instance DIA_Lothar_ToMiliz (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToMiliz_Condition;
	information	 = 	DIA_Lothar_ToMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"Jak mogê zostaæ cz³onkiem stra¿y?";
};
func int DIA_Lothar_ToMiliz_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToMiliz_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_26"); //Jak mogê zostaæ cz³onkiem stra¿y?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_27"); //Wedle rozkazu Lorda Hagena jedynie obywatele miasta mog¹ zaci¹gaæ siê do stra¿y.
		AI_Output (other, self, "DIA_Lothar_Add_15_28"); //Rozumiem.
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_29"); //Jeœli chcesz siê dowiedzieæ czegoœ wiêcej, porozmawiaj z Lordem Andre. Znajdziesz go w koszarach.
};	

// ***************************************************************
//							ToPaladins 				E2
// ***************************************************************
instance DIA_Lothar_ToPaladins (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToPaladins_Condition;
	information	 = 	DIA_Lothar_ToPaladins_Info;
	permanent    =  FALSE;
	description	 = 	"Co muszê zrobiæ, ¿eby zdobyæ tak¹ zbrojê jak twoja?";
};
func int DIA_Lothar_ToPaladins_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_ToMiliz))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToPaladins_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_30"); //Co muszê zrobiæ, ¿eby zdobyæ tak¹ zbrojê jak twoja?
	if (other.guild != GIL_MIL)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_31"); //Co takiego?! Nawet nie jesteœ cz³onkiem stra¿y!
	};
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_32"); //Nie jesteœ nawet OBYWATELEM!
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_33"); //Sk¹d ci przysz³o do g³owy, ¿e móg³byœ za³o¿yæ zbrojê PALADYNA?
	AI_Output (self ,other, "DIA_Lothar_Add_01_34"); //Tylko kilku cz³onków stra¿y, którzy wykazali siê szczególnymi zas³ugami, dost¹pi³o tego zaszczytu.
	AI_Output (self ,other, "DIA_Lothar_Add_01_35"); //Jeœli chcesz zostaæ paladynem, masz przed sob¹ d³ug¹ drogê, ch³opcze!
};	

// ***************************************************************
//							WoAndre 				E2
// ***************************************************************
instance DIA_Lothar_WoAndre (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	8;
	condition	 = 	DIA_Lothar_WoAndre_Condition;
	information	 = 	DIA_Lothar_WoAndre_Info;
	permanent    =  FALSE;
	description	 = 	"Gdzie mogê znaleŸæ przywódcê stra¿y miejskiej?";
};
func int DIA_Lothar_WoAndre_Condition ()
{	
	if ( Npc_KnowsInfo(other, DIA_Lothar_Regeln) || Npc_KnowsInfo(other, DIA_Lothar_MESSAGE) )
	&& (Andre.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoAndre_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WoAndre_15_00"); //Gdzie mogê znaleŸæ przywódcê stra¿y miejskiej?
	AI_Output (self, other, "DIA_Lothar_WoAndre_01_01"); //Lord Andre przebywa w koszarach po drugiej stronie miasta.
};	

// ***************************************************************
//							Schlafen 				E2
// ***************************************************************
instance DIA_Lothar_Schlafen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	9;
	condition	 = 	DIA_Lothar_Schlafen_Condition;
	information	 = 	DIA_Lothar_Schlafen_Info;
	permanent    =  FALSE;
	description	 = 	"Gdzie mogê spêdziæ noc?";
};
func int DIA_Lothar_Schlafen_Condition ()
{	
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_22"); //Gdzie mogê spêdziæ noc?
	AI_Output (self ,other, "DIA_Lothar_Add_01_23"); //Jeœli szukasz miejsca do spania, udaj siê do gospody naprzeciwko koszar.
	AI_Output (self ,other, "DIA_Lothar_Add_01_24"); //Paladyni op³acaj¹ kwatery dla wszystkich przyjezdnych.
	AI_Output (self ,other, "DIA_Lothar_Add_01_25"); //Wêdrowni handlarze równie¿ tam sypiaj¹.
};	

// ***************************************************************
//							PERM - VOR OV				
// ***************************************************************
instance DIA_Lothar_PermB4OV (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 3;
	condition	= DIA_Lothar_PermB4OV_Condition;
	information	= DIA_Lothar_PermB4OV_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
func int DIA_Lothar_PermB4OV_Condition ()
{	
	if (Npc_IsInState(self, ZS_Talk))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Lothar_Regeln == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PermB4OV_Info ()
{
	AI_Output (self, other, "DIA_Lothar_PermB4OV_01_00"); //O ca³ej reszcie dowiesz siê od Lorda Andre!
	AI_StopProcessInfos(self);
};	
	

// ***************
// 		Blubb
// ***************

func void B_Lothar_Blubb() //überflüsige Outputs
{
	AI_Output (other, self, "DIA_Lothar_Add_15_00"); //Ale ja naprawdê muszê siê zobaczyæ z Lordem Hagenem!

	AI_Output (self ,other, "DIA_Lothar_Add_01_45"); //Jak widzê, przyj¹³ ciê w szeregi stra¿ników.
	AI_Output (self ,other, "DIA_Lothar_Add_01_46"); //Hmmm - s¹dzê, ¿e wie, co robi.
	
	AI_Output (other, self, "DIA_Lothar_Add_15_20"); //Ilu jest mistrzów?
	AI_Output (self ,other, "DIA_Lothar_Add_01_21"); //Z tego co wiem, piêciu.
		
	AI_Output (self ,other, "DIA_Lothar_Add_01_62"); //Czy nie wyrazi³em siê wystarczaj¹co jasno? ¯adnych opowieœci o smokach!
	AI_Output (other, self, "DIA_Lothar_Add_15_63"); //Sk¹d wiesz...?
	AI_Output (self ,other, "DIA_Lothar_Add_01_64"); //To nie twoja sprawa!
	AI_Output (self ,other, "DIA_Lothar_Add_01_65"); //To ostatnie ostrze¿enie, zrozumiano?!
	
	AI_Output (other, self, "DIA_Lothar_Add_15_66"); //Gdzie mogê znaleŸæ dowódcê stra¿y?
	AI_Output (other, self, "DIA_Lothar_Add_15_08"); //Jestem czeladnikiem praktykuj¹cym u jednego z mistrzów!
	
	// ------ NEWS_Modul für Unterstadt ------
	AI_Output (self ,other, "DIA_Lothar_Add_01_47"); //To znowu ty.

	AI_Output (self ,other, "DIA_Lothar_Add_01_43"); //S³ysza³em, ¿e by³eœ u Lorda Andre?
	AI_Output (self ,other, "DIA_Lothar_Add_01_44"); //Powiedzia³em ci, ¿e do stra¿y mog¹ wstêpowaæ tylko i wy³¹cznie obywatele miasta.

	AI_Output (self ,other, "DIA_Lothar_Add_01_48"); //Przekaza³em Lordowi Hagenowi, ¿e chcia³byœ z nim porozmawiaæ...
	AI_Output (other, self, "DIA_Lothar_Add_15_49"); //No i co powiedzia³?
	AI_Output (self ,other, "DIA_Lothar_Add_01_50"); //Nigdy o tobie nie s³ysza³.
	AI_Output (other, self, "DIA_Lothar_Add_15_51"); //Oczywiœcie, ¿e nie. Powiedzia³eœ mu o smokach?
	AI_Output (self ,other, "DIA_Lothar_Add_01_52"); //Czy nie mówi³em ci, ¿ebyœ skoñczy³ wreszcie z tymi opowieœciami?!

	AI_Output (self ,other, "DIA_Lothar_Add_01_12"); //S³ysza³em, ¿e podobno zdoby³eœ ju¿ poparcie niektórych mistrzów.
	AI_Output (self ,other, "DIA_Lothar_Add_01_13"); //Traktujesz to bardzo powa¿nie, prawda?

	AI_Output (self ,other, "DIA_Lothar_Add_01_01"); //Obowi¹zuj¹ ciê pewne przepisy, tak jak wszystkich!
	AI_Output (self ,other, "DIA_Lothar_Add_01_02"); //Lord Hagen jest nieosi¹galny.
	AI_Output (self ,other, "DIA_Lothar_Add_01_03"); //Jeœli faktycznie masz coœ wa¿nego do powiedzenia, udaj siê do Lorda Andre. On ci pomo¿e.
};


// #########################################
// #########################################
		
// 				Im Oberen Viertel
		
// #########################################
// #########################################


// ***************************************************************
//								OV Regeln
// ***************************************************************
instance DIA_Lothar_HelloAgain (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_HelloAgain_Condition;
	information	 = 	DIA_Lothar_HelloAgain_Info;
	permanent    =  FALSE;
	important 	 = 	TRUE;
};
func int DIA_Lothar_HelloAgain_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	{
		return TRUE;
	};
};
func void DIA_Lothar_HelloAgain_Info ()
{
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_00"); //Aaa! To znowu ty!
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_01"); //A wiêc uda³o ci siê w koñcu przedostaæ do górnego miasta!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_36"); //Sk¹d masz tê szatê?
		AI_Output (other, self, "DIA_Lothar_Add_15_37"); //Przeszed³em Próbê Ognia.
		AI_Output (self ,other, "DIA_Lothar_Add_01_38"); //Niesamowite. A wiêc to wszystko musi siê dziaæ z woli Innosa...
	};

	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_39"); //Przy³¹czy³eœ siê do Onara i jego najemników, prawda?
		AI_Output (self ,other, "DIA_Lothar_Add_01_40"); //Jak siê tu dosta³eœ?
		AI_Output (other, self, "DIA_Lothar_Add_15_41"); //Przychodzê z propozycj¹ pokojow¹ od Lee...
		AI_Output (self ,other, "DIA_Lothar_Add_01_42"); //E tam! Lord Hagen nigdy siê na to nie zgodzi.
	};
		
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_02"); //Panuj¹ tutaj pewne prawa, których musisz przestrzegaæ. Inaczej znajdziesz siê poza murami miasta równie szybko, jak zosta³eœ wpuszczony!
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_03"); //Wolno ci wchodziæ jedynie do budynków przeznaczonych dla handlarzy. Rozpoznasz je po znakach na drzwiach. Chcê, ¿ebyœmy siê dobrze zrozumieli.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_04"); //Inne domy nale¿¹ do bogatych obywateli - nie masz tam czego szukaæ!
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV) 
	{
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_05"); //Nawet jeœli nale¿ysz do zakonu Innosa.
	};
	if (other.guild == GIL_MIL)
	{	
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_06"); //Jako cz³onek stra¿y masz prawo wchodziæ do pokojów paladynów.
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_07"); //Jednak twoja kwatera znajduje siê w koszarach.
	};
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_08"); //W tej dzielnicy mieszkaj¹ wa¿ni obywatele. Traktuj ich z szacunkiem.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_09"); //Rozumiemy siê?
	AI_Output (other, self, "DIA_Lothar_HelloAgain_15_10"); //Oczywiœcie.
};	

// ***************************************************************
//								Hagen
// ***************************************************************
instance DIA_Lothar_Hagen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_Hagen_Condition;
	information	 = 	DIA_Lothar_Hagen_Info;
	permanent    =  TRUE;
	description  = 	"Gdzie mogê znaleŸæ Lorda Hagena?";
};
func int DIA_Lothar_Hagen_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Hagen_15_00"); //Gdzie mogê znaleŸæ Lorda Hagena?
	AI_Output (self, other, "DIA_Lothar_Hagen_01_01"); //Przebywa w ratuszu miejskim, na samym koñcu górnego miasta.
	AI_Output (self, other, "DIA_Lothar_Hagen_01_02"); //Jednak nie zostaniesz tam wpuszczony, jeœli nie podasz dobrego powodu.
};

// ***************************************************************
//							Oldworld Running
// ***************************************************************
instance DIA_Lothar_OWRunning (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunning_Condition;
	information	 = 	DIA_Lothar_OWRunning_Info;
	permanent    =  FALSE;
	description  = 	"Poszed³em do Lorda Hagena...";
};
func int DIA_Lothar_OWRunning_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) == 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunning_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_53"); //Poszed³em do Lorda Hagena...
	AI_Output (self ,other, "DIA_Lothar_Add_01_54"); //I co? Chyba nie zadrêcza³eœ go tymi swoimi opowieœciami o smokach, prawda?
	AI_Output (other, self, "DIA_Lothar_Add_15_55"); //Zadrêcza³em.
	AI_Output (self ,other, "DIA_Lothar_Add_01_56"); //Powiedz mi, ¿e nie mówisz powa¿nie...
	AI_Output (other, self, "DIA_Lothar_Add_15_57"); //Kaza³ mi zdobyæ jakiœ dowód.
	AI_Output (self ,other, "DIA_Lothar_Add_01_58"); //A zatem - powodzenia... Co za wariat...
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							Oldworld Running UND Brief
// ***************************************************************
instance DIA_Lothar_OWRunningBrief (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunningBrief_Condition;
	information	 = 	DIA_Lothar_OWRunningBrief_Info;
	permanent    =  FALSE;
	description  = 	"Mam dowód! Oto list od kapitana Garonda!";
};
func int DIA_Lothar_OWRunningBrief_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunningBrief_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_59"); //Mam dowód! Oto list od kapitana Garonda!
	AI_Output (self ,other, "DIA_Lothar_Add_01_60"); //A wiêc smoki naprawdê istniej¹?
	AI_Output (self ,other, "DIA_Lothar_Add_01_61"); //By³em wobec ciebie niesprawiedliwy. Z³o¿ê ofiarê Innosowi, aby wybaczy³ mi moje zachowanie.
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//								PERM
// ***************************************************************
instance DIA_Lothar_PERM (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_PERM_Condition;
	information	 = 	DIA_Lothar_PERM_Info;
	permanent    =  TRUE;
	description  = 	"Czy ostatnio wydarzy³o siê tu coœ niezwyk³ego?";
};
func int DIA_Lothar_PERM_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PERM_Info ()
{
	AI_Output (other, self, "DIA_Lothar_PERM_15_00"); //Czy zdarzy³o siê tu ostatnio coœ ciekawego?
	if (other.guild == GIL_NONE)
	|| (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_01"); //Tak, ¿e wpuœcili tutaj kogoœ takiego jak ty. To absolutny ewenement.
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_02"); //Chyba sam powinieneœ to wiedzieæ najlepiej. W koñcu jako cz³onek stra¿y, zajmujesz siê pilnowaniem porz¹dku w tym mieœcie!
	}
	else //KdF oder NOV
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_03"); //Nie.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lothar_PICKPOCKET (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 900;
	condition	= DIA_Lothar_PICKPOCKET_Condition;
	information	= DIA_Lothar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Lothar_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Lothar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lothar_PICKPOCKET);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_BACK 		,DIA_Lothar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lothar_PICKPOCKET_DoIt);
};

func void DIA_Lothar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};
	
func void DIA_Lothar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};





