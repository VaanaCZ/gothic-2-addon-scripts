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
	description = "(Kradzie¿ tego mieszka bêdzie ³atwa)";
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
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_01"); //Kim jesteœ? Wygl¹da na to, ¿e chyba nie wiesz za bardzo, co siê tutaj dzieje.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_02"); //Nazywaj¹ mnie Gerbrandt. Ale dla ciebie jestem Pan Gerbrandt, jasne?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Rozumiem.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Zrozumia³em, proszê pana.",DIA_Gerbrandt_Hello_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_No_15_00"); //Rozumiem.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_01"); //Uwa¿aj na s³owa. Lepiej traktuj mnie z nale¿ytym szacunkiem, bo mo¿esz wpaœæ w k³opoty.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_02"); //To ja poci¹gam tutaj za sznurki. Jeœli ktoœ sprawia k³opoty, to czeka go spotkanie ze mn¹, wiêc lepiej, ¿eby czym prêdzej opuœci³ miasto, albo po¿a³uje.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_03"); //Wiêkszoœæ ludzi w porcie pracuje dla mnie. Jeœli kiedyœ bêdziesz szuka³ pracy, by³oby lepiej dla ciebie, ¿ebyœ mi siê dobrze kojarzy³.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_15_00"); //Zrozumia³em, proszê pana.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_01"); //Przynajmniej szybko za³apa³eœ, jak tu sprawy stoj¹.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_02"); //Jestem pewien, ¿e gdy tylko interes zacznie siê znowu krêciæ, przyda mi siê taki postawny ch³op jak ty.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_03"); //By³byœ doskona³ym magazynierem.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_04"); //Umiesz czytaæ?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Nie.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Nie chcê pracy.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Oczywiœcie.",DIA_Gerbrandt_Hello_Yes_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_No_15_00"); //Nie.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_01"); //Niewa¿ne, przynajmniej bêdziesz móg³ nosiæ worki.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_02"); //Je¿eli bêdê zadowolony z twojej postawy, byæ mo¿e zaoferujê ci sta³¹ posadê. Tutaj nie brakuje pracy.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_03"); //Zatem bêdê ciê oczekiwa³, kiedy do doków zawin¹ pierwsze statki.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_NoJob ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_NoJob_15_00"); //Nie chcê pracy.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_01"); //Wydaje ci siê, ¿e jesteœ strasznie m¹dry. Uwa¿aj, bo tutaj nikt nie dostanie roboty, jeœli siê na to nie zgodzê.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_02"); //Jak nie przestaniesz pyskowaæ, to bêdziesz spaæ na zapluskwionym materacu - bo tylko na tyle bêdzie ciê staæ.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_03"); //Przyjdzie czas, ¿e bêdziesz mnie b³agaæ o pracê.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_Yes ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //Oczywiœcie.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //Dobrze, dobrze. Trudno znaleŸæ wykwalifikowanych pracowników.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //Masz mo¿e jakieœ referencje?
	AI_Output (other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //Referencje?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //No dobrze, zapamiêtam twoj¹ twarz. Kiedy interes znowu zacznie siê krêciæ, przyjdŸ do mnie. Byæ mo¿e bêdê mia³ dla ciebie pracê.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

FUNC VOID B_GErbrandt_PissOff ()
{
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_00"); //O co chodzi? Kpisz ze mnie?
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_01"); //Ty i ten twój kole¿ka Diego narobiliœcie ju¿ doœæ zniszczeñ.
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
	description	= "Coœ nowego?";
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
	AI_Output (other,self ,"DIA_Gerbrandt_Perm_15_00"); //Coœ nowego?
	
	if (Kapitel <= 2)
	{
		if (hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_01"); //Tacy jak ty nie maj¹ tu czego szukaæ. Tutaj mieszkaj¹ szanowani obywatele, a nie w³óczêdzy i oszuœci.
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_02"); //Je¿eli kiedyœ uda ci siê zdobyæ bogactwo i szacunek, to byæ mo¿e spotka ciê tutaj cieplejsze powitanie.
		}
		else
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_03"); //Nie mogê siê skar¿yæ, Szlachetny Panie.
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if (hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL)
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_04"); //Widzia³em ju¿ takich jak ty - po prostu nie wiecie, gdzie wasze miejsce.
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_05"); //Porozmawiam z gubernatorem na temat podjêcia odpowiednich œrodków bezpieczeñstwa w górnym mieœcie.
			}
			else
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_06"); //To moja prywatna sprawa. Jestem zajêty!
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
	description	= "Diego przesy³a pozdrowienia.";
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
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_00"); //Diego przesy³a pozdrowienia.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01"); //Co? Kto? Jaki Diego? Co za Diego?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_02"); //I chcia³, ¿ebym przekaza³ ci ten list.
	
	B_GiveInvItems (other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03"); //To niemo¿liwe. Nie. Ju¿ po mnie!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04"); //Czy jest w mieœcie?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_05"); //Kto?
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06"); //Diego, oczywiœcie!
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_07"); //Tak, wkrótce mamy siê tu spotkaæ.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08"); //Zatem to koniec. Wszystko stracone.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09"); //Nie mam czasu. Muszê siê st¹d wynosiæ i to szybko. Jeœli mnie tu znajdzie, jestem skoñczony.
	
	MIS_DiegosResidence = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_DiegosResidence);
	
	DIEGO_COMING = TRUE;
};
