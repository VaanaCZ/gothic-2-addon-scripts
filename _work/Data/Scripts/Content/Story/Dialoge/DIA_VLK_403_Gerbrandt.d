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
	description = "(Ukrást mu penêženku nebude nic têžkého.)";
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
	description = "Co tady dêláš?";
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
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_15_00"); //Co tady dêláš?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_01"); //A ty jsi kdo? Vypadá to, že jsi tu novej a nemáš ani tucha, jak to tady chodí.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_02"); //Âíkají mi Gerbrandt. Pro tebe to znamená: pan Gerbrandt. Jasný?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Jo, jasný, Gerbrandte.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Rozumím, pane Gerbrandte.",DIA_Gerbrandt_Hello_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_No_15_00"); //Jo jasný, Gerbrandte.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_01"); //Bacha na tu svou nevymáchanou hubu. Mêl bys mi radši prokazovat víc úcty, nebo si tady zadêláš na poâádný trable.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_02"); //Tady rozkazuju já. Kdokoli tu zpùsobí nêjaké potíže, bude se zodpovídat mnê a udêlá nejlíp, když kvaltem opustí mêsto. Protože jestli se mi dostane do rukou, tak bude velmi litovat toho, že se se mnou kdy setkal.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_03"); //Vêtšina lidí z okolí pâístavu pracuje pro mê. Jestli hledáš práci, mêl by sis dávat velký pozor na to, abys mi utkvêl v pamêti jako hodnej hoch.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_15_00"); //Rozumím, pane Gerbrandte.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_01"); //Nakonec ti netrvalo moc dlouho, než ti došlo, která bije.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_02"); //Jakmile se zaènou hejbat obchody, budu potâebovat urostlýho chlapa, jako jsi ty.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_03"); //Máte tu pêkný doky.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_04"); //Umíš èíst?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Ne.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Nehledám práci.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Samozâejmê.",DIA_Gerbrandt_Hello_Yes_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_No_15_00"); //Ne.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_01"); //Nevadí. Alespoà mùžeš odnést pár pytlù.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_02"); //Jsem s tebou spokojený, mùžu ti nabídnout stálou práci. Je toho tady dost, co je tâeba udêlat.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_03"); //Dobrá, dám ti vêdêt, až se první loë vrátí do dokù.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_NoJob ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_NoJob_15_00"); //Nehledám práci.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_01"); //Asi si myslíš, jak jsi strašnê chytrej. Koukej, nikdo tu nemùže dostat práci, dokud s tím já nebudu souhlasit.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_02"); //Takže jestli budeš takhle pyskovat, mùžeš si zaèít hledat tou nejhnusnêjší havêtí prolezlej slamník na spaní, protože to bude všechno, co si budeš moct dovolit.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_03"); //Ještê za mnou pâilezeš a budeš žadonit o práci.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_Yes ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //Samozâejmê.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //Fajn, fajn, dostat se ke kvalifikovanýmu personálu není nic lehkýho.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //Co tvá doporuèení?
	AI_Output (other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //Doporuèení?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //Dobrá, budu si tê pamatovat. Jakmile se zase zaènou hejbat obchody, pâijë se mi ukázat. Pak pro tebe budu možná mít nêjakou práci.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

FUNC VOID B_GErbrandt_PissOff ()
{
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_00"); //Co jako má být tohle - dêláš si ze mê srandu?
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_01"); //Ty a ten tvùj kámoš Diego už jste nadêlali dost škody.
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_02"); //Nech mê být!
	
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
	description	= "Co je nového?";
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
	AI_Output (other,self ,"DIA_Gerbrandt_Perm_15_00"); //Nêco nového?
	
	if (Kapitel <= 2)
	{
		if (hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_01"); //Lidi jako ty nemají tady nahoâe co dêlat. Tady bydlí vážení obèané, ne nêjací tuláci nebo podvodníci.
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_02"); //Jestli se ti nêkdy podaâí zbohatnout a dojít úcty, pak tady možná budeš vítanêjší.
		}
		else
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_03"); //Nemùžu si stêžovat, vážený pane.
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if (hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL)
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_04"); //Už jsem vidêl tobê podobné - prostê nevíte, kam patâíte.
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_05"); //Musím si promluvit s místodržícím ohlednê odpovídajícího zabezpeèení horní ètvrti.
			}
			else
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_06"); //Tohle je jenom moje záležitost. Nemám èas!
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
	description	= "Diego se nechá pozdravovat.";
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
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_00"); //Diego se nechá pozdravovat.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01"); //(vydêšenê) Co? Kdo? Jaký Diego?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_02"); //A taky mê požádal, abych ti dal tenhle dopis.
	
	B_GiveInvItems (other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03"); //(znepokojenê) To nemùže být pravda. Ne. Jsem mrtvý muž!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04"); //(ustrašenê) Je teda ve mêstê?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_05"); //Kdo?
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06"); //Diego, pâece!
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_07"); //Ano, zanedlouho se s ním setkám.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08"); //(zoufale, pro sebe) Tak to je konec. Všechno je v tahu.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09"); //Nemám èas, musím odtud vypadnout. Jestli mê tu najde, jsem vyâízenej.
	
	MIS_DiegosResidence = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_DiegosResidence);
	
	DIEGO_COMING = TRUE;
};
