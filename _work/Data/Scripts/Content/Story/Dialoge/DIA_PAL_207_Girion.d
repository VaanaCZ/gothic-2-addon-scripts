///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_EXIT   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 999;
	condition   = DIA_Girion_EXIT_Condition;
	information = DIA_Girion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Girion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Girion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_Hallo   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_Hallo_Condition;
	information = DIA_Girion_Hallo_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Girion_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (MIS_ShipIsFree == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Girion_Hallo_Info()
{
	AI_Output (self, other, "DIA_Girion_Hallo_08_00"); //Jestem Girion, mistrz walki broni� obur�czn� i kr�lewski paladyn. Czemu mnie niepokoisz?
};
///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_CanTeach		(C_INFO)
{
	npc			 = 	PAL_207_Girion;
	nr			 = 	5;
	condition	 = 	DIA_Girion_CanTeach_Condition;
	information	 = 	DIA_Girion_CanTeach_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Czy mo�esz mnie wyszkoli�?";
};
func int DIA_Girion_CanTeach_Condition ()
{	
	if (Girion_Teach2H == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Girion_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Girion_CanTeach_15_00"); //Czy mo�esz udzieli� mi lekcji?
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Girion_CanTeach_08_01"); //Wybieraj�c najszlachetniejsz� ze wszystkich sztuk walk, post�pi�e� jak prawdziwy wojownik Innosa.
		AI_Output (self, other, "DIA_Girion_CanTeach_08_02"); //Udziel� ci kilku wskaz�wek. Daj mi zna�, kiedy b�dziesz got�w do treningu.
		
		Girion_Teach2H = TRUE;	
		B_LogEntry (TOPIC_CityTeacher,"Paladyn Girion mo�e mnie nauczy�, jak walczy� or�em dwur�cznym.");
	}
	else
	{
		AI_Output (self, other, "DIA_Girion_CanTeach_08_03"); //Je�li chcesz si� uczy�, musisz znale�� sobie mentora poza naszym zakonem.
		AI_Output (self, other, "DIA_Girion_CanTeach_08_04"); //Jestem wojownikiem, nie nauczycielem.
	};
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Girion_Teach(C_INFO)
{
	npc			= PAL_207_Girion;
	nr			= 100;
	condition	= DIA_Girion_Teach_Condition;
	information	= DIA_Girion_Teach_Info;
	permanent	= TRUE;
	description = "Jestem got�w do treningu.";
};                       
//----------------------------------
var int DIA_Girion_Teach_permanent;
//----------------------------------
FUNC INT DIA_Girion_Teach_Condition()
{
	if (Girion_Teach2H == TRUE)
	&& (DIA_Girion_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
// -------------------------------
var int  girion_merk2h;
// ------------------------------- 
FUNC VOID DIA_Girion_Teach_Info()
{	
	girion_merk2h = other.HitChance[NPC_TALENT_2H];  
	
	AI_Output (other,self ,"DIA_Girion_Teach_15_00"); //Jestem got�w do treningu.
	
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);

};
FUNC VOID DIA_Girion_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_00"); //Oczywi�cie, to jeszcze nie koniec twojej edukacji, ale ja nie potrafi� ci� nauczy� niczego wi�cej.
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_01"); //Je�li chcesz dalej �wiczy� walk� wr�cz, powiniene� poszuka� prawdziwego mistrza miecza.
		AI_Output (other,self,"DIA_DIA_Girion_Teach_15_02"); //Gdzie mog� znale�� kogo� takiego?
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_03"); //Lord Hagen jest mistrzem miecza. Z pewno�ci� udzieli ci lekcji.
		
		DIA_Girion_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Girion_Teach);
};

FUNC VOID DIA_Girion_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);
	
	if (other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if (Girion_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_00"); //Zawsze walcz honorowo. Walka to nasze �ycie - a czym jest �ycie bez honoru?
		};
		if (Girion_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_01"); //W walce b�d� szybki i ostro�ny. Zaskakuj swoich przeciwnik�w.
		};
		if (Girion_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_02"); //Nigdy nie rozpoczynaj walki bez odpowiedniego przygotowania. Ka�dy pojedynek mo�e by� twoim ostatnim.
		};
		if (Girion_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_03"); //Paladyn jest zawsze got�w do walki. Jednak nigdy nie wdaje si� w pojedynki, w kt�rych nie ma �adnych szans na zwyci�stwo.
		};
		
		Girion_Labercount = Girion_Labercount +1;
		if (Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;	
		};
	};
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);	
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);	
};

FUNC VOID DIA_Girion_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
	
	if (other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if (Girion_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_00"); //Broni� paladyna jest nie tylko jego miecz, ale r�wnie� sprawny umys�.
		};
		if (Girion_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_01"); //Musisz wiedzie�, kiedy mo�esz si� wycofa�.
		};
		if (Girion_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_02"); //Pami�taj, dobra walka to taka, w kt�rej to ty kontrolujesz swojego przeciwnika, nie daj�c mu najmniejszej szansy na przej�cie kontroli nad tob�.
		};
		if (Girion_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_03"); //Przegrywasz tylko wtedy, gdy si� poddasz.
		};
		
		Girion_Labercount = Girion_Labercount +1;
		if (Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;	
		};
	};
	
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);	
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);	
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info CatchPlayerStolenShip
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_CATCHPLAYERSTOLENSHIP		(C_INFO)
{
	npc		 = 	PAL_207_Girion;
	nr		 = 	5;
	condition	 = 	DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition;
	information	 = 	DIA_Girion_CATCHPLAYERSTOLENSHIP_Info;
	important	 = 	TRUE;
};

func int DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition ()
{
	if (Kapitel >= 5)
	&& (MIS_ShipIsFree == TRUE) 
	&& (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25")<1000) //Joly: ist nur hier, wenn SC die Wachen �berredet hat, ihm das Schiff zu geben.
	{
		return TRUE;
	};
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_Info ()
{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00"); //Hej! Mo�esz mi powiedzie�, co tutaj robisz?

	Info_ClearChoices	(DIA_Girion_CATCHPLAYERSTOLENSHIP);
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "Nie wiem, o czym m�wisz.", DIA_Girion_CATCHPLAYERSTOLENSHIP_no );
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "Zejd� mi z drogi albo b�d� zmuszony ci� zabi�.", DIA_Girion_CATCHPLAYERSTOLENSHIP_weg );
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "Potrzebuj� okr�tu.", DIA_Girion_CATCHPLAYERSTOLENSHIP_ship );

};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_no ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00"); //Nie wiem, o czym m�wisz.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01"); //M�wi� o tym, co wykombinowa�e� ze stra�� okr�tow�. Podejrzana sprawa.

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02"); //Je�li nawet jeste� magiem, nie ufam ci.
	};
};
var int Girion_WantstoKillSC;
func void DIA_Girion_CATCHPLAYERSTOLENSHIP_weg ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00"); //Zejd� mi z drogi albo b�d� zmuszony ci� zabi�.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01"); //Mo�esz by� wystarczaj�co sprytny, aby poradzi� sobie ze stra�� okr�tow�, ale ze mn� nie p�jdzie ci tak �atwo, ch�opcze.
	if (hero.guild == GIL_PAL)
	{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02"); //Je�li nawet jeste� jednym z nas, nie daje ci to prawa do kradzie�y kr�lewskiej w�asno�ci. Gi�, przekl�ty zdrajco.
	};
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Girion_WantstoKillSC = TRUE;
};

func void B_GirionStayOnShip()
{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09"); //Kiedy sko�czymy interesy, statek wr�ci do mnie. Czy to jasne?
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_ship ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00"); //Potrzebuj� statku. Wi�c go sobie wezm�.
	
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01"); //Nie mo�esz tego zrobi�. Transport rudy...
	}
	else
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02"); //Jak �miesz, ty �mierdz�cy skur...
	};
	
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03"); //W G�rniczej Dolinie jest zbyt ma�o rudy, aby zaspokoi� kr�lewskie wymagania. By�em tam. Z�o�a si� wyczerpa�y. Misja Hagena to jedna wielka farsa.
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04"); //Prawdziwe zagro�enie stanowi pewna niewielka przybrze�na wysepka, ca�kiem niedaleko st�d. Pop�yn� tam i po�o�� wszystkiemu kres.
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05"); //Albo si� do mnie przy��czysz, albo zrobi� z tob� porz�dek raz na zawsze. Wyb�r nale�y do ciebie.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06"); //Hmmm. Wygl�da na to, �e nie mam wyboru.
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07"); //Dok�adnie tak.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08"); //A zatem dobrze. Przy��cz� si� do ciebie, ale tylko pod jednym warunkiem.

	B_GirionStayOnShip();

	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10"); //Jako� to prze�yj�.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11"); //A zatem r�b, co masz do zrobienia. Poczekam tutaj na ciebie.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	crewmember_Count = (Crewmember_Count +1);
	Girion_IsOnBoard = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Verrat 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_Verrat   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_Verrat_Condition;
	information = DIA_Girion_Verrat_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

FUNC INT DIA_Girion_Verrat_Condition()
{
	if (Girion_WantstoKillSC == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Girion_Verrat_Info()
{
	AI_Output			(self, other, "DIA_Girion_Verrat_08_00"); //Zdrajca!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};


///////////////////////////////////////////////////////////////////////
//	Info OnShip 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_OnShip   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_OnShip_Condition;
	information = DIA_Girion_OnShip_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

FUNC INT DIA_Girion_OnShip_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Girion_IsOnBoard == LOG_SUCCESS)
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Girion_OnShip_Info()
{
	B_GirionStayOnShip();
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Girion_PICKPOCKET (C_INFO)
{
	npc			= PAL_207_Girion;
	nr			= 900;
	condition	= DIA_Girion_PICKPOCKET_Condition;
	information	= DIA_Girion_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Girion_PICKPOCKET_Condition()
{
	C_Beklauen (73, 280);
};
 
FUNC VOID DIA_Girion_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Girion_PICKPOCKET);
	Info_AddChoice		(DIA_Girion_PICKPOCKET, DIALOG_BACK 		,DIA_Girion_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Girion_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Girion_PICKPOCKET_DoIt);
};

func void DIA_Girion_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Girion_PICKPOCKET);
};
	
func void DIA_Girion_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Girion_PICKPOCKET);
};



