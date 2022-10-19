// ************************************************************
// 			  				   EXIT 
// ************************************************************

var int DIEGO_COMING;
// -------------------------

INSTANCE DIA_Gerbrandt_EXIT(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 999;
	condition	= DIA_Gerbrandt_EXIT_Condition;
	information	= DIA_Gerbrandt_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gerbrandt_EXIT_Info()
{	
	if (DIEGO_COMING == TRUE)
	{
		DiegoNW = Hlp_GetNpc (PC_THIEF_NW);
				
		if ( Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine (DiegoNW,"GERBRANDT");
		};	
		//patch m.f. B_Startotherroutine raus und ersetzt durch Npc_exchange 
		
		Npc_ExchangeRoutine  (self,"NEWLIFE");
		B_StartOtherRoutine (GerbrandtsFrau,"NEWLIFE");
		
		DIEGO_COMING = 2; //Weder TRUE noch False
	};
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gerbrandt_PICKPOCKET (C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 900;
	condition	= DIA_Gerbrandt_PICKPOCKET_Condition;
	information	= DIA_Gerbrandt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie� tego mieszka b�dzie �atwa)";
};                       

FUNC INT DIA_Gerbrandt_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket100) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	&& (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Gerbrandt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gerbrandt_PICKPOCKET);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_BACK 		,DIA_Gerbrandt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gerbrandt_PICKPOCKET_DoIt);
};

func void DIA_Gerbrandt_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket100, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Gerbrandt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
};
// ************************************************************
// 			  				  Hallo
// ************************************************************

INSTANCE DIA_Gerbrandt_Hello(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 5;
	condition	= DIA_Gerbrandt_Hello_Condition;
	information	= DIA_Gerbrandt_Hello_Info;
	permanent	= FALSE;
	description = "Co tu porabiasz?";
};                       

FUNC INT DIA_Gerbrandt_Hello_Condition()
{
	if (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_PAL)
	&& (DIEGO_COMING == FALSE) //nur BEVOR Diego kommt
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_15_00"); //Co tu robisz?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_01"); //Kim jeste�? Wygl�da na to, �e chyba nie wiesz za bardzo, co si� tutaj dzieje.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_02"); //Nazywaj� mnie Gerbrandt. Ale dla ciebie jestem Pan Gerbrandt, jasne?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Rozumiem.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Zrozumia�em, prosz� pana.",DIA_Gerbrandt_Hello_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_No_15_00"); //Rozumiem.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_01"); //Uwa�aj na s�owa. Lepiej traktuj mnie z nale�ytym szacunkiem, bo mo�esz wpa�� w k�opoty.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_02"); //To ja poci�gam tutaj za sznurki. Je�li kto� sprawia k�opoty, to czeka go spotkanie ze mn�, wi�c lepiej, �eby czym pr�dzej opu�ci� miasto, albo po�a�uje.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_03"); //Wi�kszo�� ludzi w porcie pracuje dla mnie. Je�li kiedy� b�dziesz szuka� pracy, by�oby lepiej dla ciebie, �eby� mi si� dobrze kojarzy�.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_15_00"); //Zrozumia�em, prosz� pana.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_01"); //Przynajmniej szybko za�apa�e�, jak tu sprawy stoj�.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_02"); //Jestem pewien, �e gdy tylko interes zacznie si� znowu kr�ci�, przyda mi si� taki postawny ch�op jak ty.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_03"); //By�by� doskona�ym magazynierem.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_04"); //Umiesz czyta�?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Nie.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Nie chc� pracy.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Oczywi�cie.",DIA_Gerbrandt_Hello_Yes_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_No_15_00"); //Nie.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_01"); //Niewa�ne, przynajmniej b�dziesz m�g� nosi� worki.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_02"); //Je�eli b�d� zadowolony z twojej postawy, by� mo�e zaoferuj� ci sta�� posad�. Tutaj nie brakuje pracy.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_03"); //Zatem b�d� ci� oczekiwa�, kiedy do dok�w zawin� pierwsze statki.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_NoJob ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_NoJob_15_00"); //Nie chc� pracy.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_01"); //Wydaje ci si�, �e jeste� strasznie m�dry. Uwa�aj, bo tutaj nikt nie dostanie roboty, je�li si� na to nie zgodz�.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_02"); //Jak nie przestaniesz pyskowa�, to b�dziesz spa� na zapluskwionym materacu - bo tylko na tyle b�dzie ci� sta�.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_03"); //Przyjdzie czas, �e b�dziesz mnie b�aga� o prac�.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_Yes ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //Oczywi�cie.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //Dobrze, dobrze. Trudno znale�� wykwalifikowanych pracownik�w.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //Masz mo�e jakie� referencje?
	AI_Output (other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //Referencje?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //No dobrze, zapami�tam twoj� twarz. Kiedy interes znowu zacznie si� kr�ci�, przyjd� do mnie. By� mo�e b�d� mia� dla ciebie prac�.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

FUNC VOID B_GErbrandt_PissOff ()
{
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_00"); //O co chodzi? Kpisz ze mnie?
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_01"); //Ty i ten tw�j kole�ka Diego narobili�cie ju� do�� zniszcze�.
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_02"); //Zostaw mnie!
	
	//Patch m.f. Wenn diego kommt und er wird gefragt, geht er nicht los, weil losgehen steht in exit info und durch diesen Ai_Stop wird das umgangen
	if (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		AI_StopProcessInfos (self);
	};
};

INSTANCE DIA_Gerbrandt_Perm(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 800;
	condition	= DIA_Gerbrandt_Perm_Condition;
	information	= DIA_Gerbrandt_Perm_Info;
	permanent	= TRUE;
	description	= "Co� nowego?";
};                       

FUNC INT DIA_Gerbrandt_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Perm_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Perm_15_00"); //Co� nowego?
	
	if (Kapitel <= 2)
	{
		if (hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_01"); //Tacy jak ty nie maj� tu czego szuka�. Tutaj mieszkaj� szanowani obywatele, a nie w��cz�dzy i oszu�ci.
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_02"); //Je�eli kiedy� uda ci si� zdoby� bogactwo i szacunek, to by� mo�e spotka ci� tutaj cieplejsze powitanie.
		}
		else
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_03"); //Nie mog� si� skar�y�, Szlachetny Panie.
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if (hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL)
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_04"); //Widzia�em ju� takich jak ty - po prostu nie wiecie, gdzie wasze miejsce.
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_05"); //Porozmawiam z gubernatorem na temat podj�cia odpowiednich �rodk�w bezpiecze�stwa w g�rnym mie�cie.
			}
			else
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_06"); //To moja prywatna sprawa. Jestem zaj�ty!
			};
		}
		else
		{
			B_Gerbrandt_PissOff ();
		};
	};
};

//################################
//##
//##	Kapitel 3
//##
//################################

INSTANCE DIA_Gerbrandt_GreetingsFromDiego(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 10;
	condition	= DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information	= DIA_Gerbrandt_GreetingsFromDiego_Info;
	permanent	= FALSE;
	description	= "Diego przesy�a pozdrowienia.";
};                       

FUNC INT DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	
	if (MIS_DiegosResidence == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_DiegosLetter_MIS) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_00"); //Diego przesy�a pozdrowienia.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01"); //Co? Kto? Jaki Diego? Co za Diego?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_02"); //I chcia�, �ebym przekaza� ci ten list.
	
	B_GiveInvItems (other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03"); //To niemo�liwe. Nie. Ju� po mnie!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04"); //Czy jest w mie�cie?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_05"); //Kto?
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06"); //Diego, oczywi�cie!
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_07"); //Tak, wkr�tce mamy si� tu spotka�.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08"); //Zatem to koniec. Wszystko stracone.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09"); //Nie mam czasu. Musz� si� st�d wynosi� i to szybko. Je�li mnie tu znajdzie, jestem sko�czony.
	
	MIS_DiegosResidence = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_DiegosResidence);
	
	DIEGO_COMING = TRUE;
};
