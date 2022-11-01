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
	description = "(Kradzież tego mieszka będzie łatwa)";
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
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_01"); //Kim jesteś? Wygląda na to, że chyba nie wiesz za bardzo, co się tutaj dzieje.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_02"); //Nazywają mnie Gerbrandt. Ale dla ciebie jestem Pan Gerbrandt, jasne?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Rozumiem.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Zrozumiałem, proszę pana.",DIA_Gerbrandt_Hello_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_No_15_00"); //Rozumiem.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_01"); //Uważaj na słowa. Lepiej traktuj mnie z należytym szacunkiem, bo możesz wpaść w kłopoty.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_02"); //To ja pociągam tutaj za sznurki. Jeśli ktoś sprawia kłopoty, to czeka go spotkanie ze mną, więc lepiej, żeby czym prędzej opuścił miasto, albo pożałuje.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_03"); //Większość ludzi w porcie pracuje dla mnie. Jeśli kiedyś będziesz szukał pracy, byłoby lepiej dla ciebie, żebyś mi się dobrze kojarzył.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_15_00"); //Zrozumiałem, proszę pana.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_01"); //Przynajmniej szybko załapałeś, jak tu sprawy stoją.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_02"); //Jestem pewien, że gdy tylko interes zacznie się znowu kręcić, przyda mi się taki postawny chłop jak ty.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_03"); //Byłbyś doskonałym magazynierem.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_04"); //Umiesz czytać?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Nie.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Nie chcę pracy.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Oczywiście.",DIA_Gerbrandt_Hello_Yes_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_No_15_00"); //Nie.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_01"); //Nieważne, przynajmniej będziesz mógł nosić worki.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_02"); //Jeżeli będę zadowolony z twojej postawy, być może zaoferuję ci stałą posadę. Tutaj nie brakuje pracy.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_03"); //Zatem będę cię oczekiwał, kiedy do doków zawiną pierwsze statki.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_NoJob ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_NoJob_15_00"); //Nie chcę pracy.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_01"); //Wydaje ci się, że jesteś strasznie mądry. Uważaj, bo tutaj nikt nie dostanie roboty, jeśli się na to nie zgodzę.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_02"); //Jak nie przestaniesz pyskować, to będziesz spać na zapluskwionym materacu - bo tylko na tyle będzie cię stać.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_03"); //Przyjdzie czas, że będziesz mnie błagać o pracę.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_Yes ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //Oczywiście.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //Dobrze, dobrze. Trudno znaleźć wykwalifikowanych pracowników.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //Masz może jakieś referencje?
	AI_Output (other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //Referencje?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //No dobrze, zapamiętam twoją twarz. Kiedy interes znowu zacznie się kręcić, przyjdź do mnie. Być może będę miał dla ciebie pracę.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

FUNC VOID B_GErbrandt_PissOff ()
{
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_00"); //O co chodzi? Kpisz ze mnie?
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_01"); //Ty i ten twój koleżka Diego narobiliście już dość zniszczeń.
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
	description	= "Coś nowego?";
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
	AI_Output (other,self ,"DIA_Gerbrandt_Perm_15_00"); //Coś nowego?
	
	if (Kapitel <= 2)
	{
		if (hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_01"); //Tacy jak ty nie mają tu czego szukać. Tutaj mieszkają szanowani obywatele, a nie włóczędzy i oszuści.
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_02"); //Jeżeli kiedyś uda ci się zdobyć bogactwo i szacunek, to być może spotka cię tutaj cieplejsze powitanie.
		}
		else
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_03"); //Nie mogę się skarżyć, Szlachetny Panie.
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if (hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL)
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_04"); //Widziałem już takich jak ty - po prostu nie wiecie, gdzie wasze miejsce.
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_05"); //Porozmawiam z gubernatorem na temat podjęcia odpowiednich środków bezpieczeństwa w górnym mieście.
			}
			else
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_06"); //To moja prywatna sprawa. Jestem zajęty!
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
	description	= "Diego przesyła pozdrowienia.";
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
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_00"); //Diego przesyła pozdrowienia.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01"); //Co? Kto? Jaki Diego? Co za Diego?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_02"); //I chciał, żebym przekazał ci ten list.
	
	B_GiveInvItems (other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03"); //To niemożliwe. Nie. Już po mnie!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04"); //Czy jest w mieście?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_05"); //Kto?
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06"); //Diego, oczywiście!
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_07"); //Tak, wkrótce mamy się tu spotkać.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08"); //Zatem to koniec. Wszystko stracone.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09"); //Nie mam czasu. Muszę się stąd wynosić i to szybko. Jeśli mnie tu znajdzie, jestem skończony.
	
	MIS_DiegosResidence = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_DiegosResidence);
	
	DIEGO_COMING = TRUE;
};
