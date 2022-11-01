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
	description = "(Ukrást mu peněženku nebude nic těžkého.)";
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
	description = "Co tady děláš?";
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
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_15_00"); //Co tady děláš?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_01"); //A ty jsi kdo? Vypadá to, že jsi tu novej a nemáš ani tucha, jak to tady chodí.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_02"); //Říkají mi Gerbrandt. Pro tebe to znamená: pan Gerbrandt. Jasný?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Jo, jasný, Gerbrandte.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Rozumím, pane Gerbrandte.",DIA_Gerbrandt_Hello_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_No_15_00"); //Jo jasný, Gerbrandte.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_01"); //Bacha na tu svou nevymáchanou hubu. Měl bys mi radši prokazovat víc úcty, nebo si tady zaděláš na pořádný trable.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_02"); //Tady rozkazuju já. Kdokoli tu způsobí nějaké potíže, bude se zodpovídat mně a udělá nejlíp, když kvaltem opustí město. Protože jestli se mi dostane do rukou, tak bude velmi litovat toho, že se se mnou kdy setkal.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_03"); //Většina lidí z okolí přístavu pracuje pro mě. Jestli hledáš práci, měl by sis dávat velký pozor na to, abys mi utkvěl v paměti jako hodnej hoch.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_15_00"); //Rozumím, pane Gerbrandte.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_01"); //Nakonec ti netrvalo moc dlouho, než ti došlo, která bije.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_02"); //Jakmile se začnou hejbat obchody, budu potřebovat urostlýho chlapa, jako jsi ty.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_03"); //Máte tu pěkný doky.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_04"); //Umíš číst?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Ne.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Nehledám práci.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Samozřejmě.",DIA_Gerbrandt_Hello_Yes_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_No_15_00"); //Ne.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_01"); //Nevadí. Alespoň můžeš odnést pár pytlů.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_02"); //Jsem s tebou spokojený, můžu ti nabídnout stálou práci. Je toho tady dost, co je třeba udělat.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_03"); //Dobrá, dám ti vědět, až se první loď vrátí do doků.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_NoJob ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_NoJob_15_00"); //Nehledám práci.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_01"); //Asi si myslíš, jak jsi strašně chytrej. Koukej, nikdo tu nemůže dostat práci, dokud s tím já nebudu souhlasit.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_02"); //Takže jestli budeš takhle pyskovat, můžeš si začít hledat tou nejhnusnější havětí prolezlej slamník na spaní, protože to bude všechno, co si budeš moct dovolit.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_03"); //Ještě za mnou přilezeš a budeš žadonit o práci.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_Yes ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //Samozřejmě.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //Fajn, fajn, dostat se ke kvalifikovanýmu personálu není nic lehkýho.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //Co tvá doporučení?
	AI_Output (other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //Doporučení?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //Dobrá, budu si tě pamatovat. Jakmile se zase začnou hejbat obchody, přijď se mi ukázat. Pak pro tebe budu možná mít nějakou práci.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

FUNC VOID B_GErbrandt_PissOff ()
{
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_00"); //Co jako má být tohle - děláš si ze mě srandu?
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_01"); //Ty a ten tvůj kámoš Diego už jste nadělali dost škody.
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_02"); //Nech mě být!
	
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
	AI_Output (other,self ,"DIA_Gerbrandt_Perm_15_00"); //Něco nového?
	
	if (Kapitel <= 2)
	{
		if (hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_01"); //Lidi jako ty nemají tady nahoře co dělat. Tady bydlí vážení občané, ne nějací tuláci nebo podvodníci.
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_02"); //Jestli se ti někdy podaří zbohatnout a dojít úcty, pak tady možná budeš vítanější.
		}
		else
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_03"); //Nemůžu si stěžovat, vážený pane.
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if (hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL)
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_04"); //Už jsem viděl tobě podobné - prostě nevíte, kam patříte.
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_05"); //Musím si promluvit s místodržícím ohledně odpovídajícího zabezpečení horní čtvrti.
			}
			else
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_06"); //Tohle je jenom moje záležitost. Nemám čas!
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
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01"); //(vyděšeně) Co? Kdo? Jaký Diego?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_02"); //A taky mě požádal, abych ti dal tenhle dopis.
	
	B_GiveInvItems (other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03"); //(znepokojeně) To nemůže být pravda. Ne. Jsem mrtvý muž!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04"); //(ustrašeně) Je teda ve městě?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_05"); //Kdo?
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06"); //Diego, přece!
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_07"); //Ano, zanedlouho se s ním setkám.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08"); //(zoufale, pro sebe) Tak to je konec. Všechno je v tahu.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09"); //Nemám čas, musím odtud vypadnout. Jestli mě tu najde, jsem vyřízenej.
	
	MIS_DiegosResidence = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_DiegosResidence);
	
	DIEGO_COMING = TRUE;
};
