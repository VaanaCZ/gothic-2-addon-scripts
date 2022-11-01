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
	description = "(Sarebbe semplice rubargli il borsello.)";
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
	description = "Cosa stai facendo, qui?";
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
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_15_00"); //Cosa stai facendo qui?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_01"); //Chi sei tu, piuttosto? Sembri uno nuovo e senza la minima idea di come vanno le cose qui.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_02"); //Mi chiamano Gerbrandt. Anzi: signor Gerbrandt, signore, per te. Hai capito?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Ho capito, Gerbrandt.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Ho afferrato, signor Gerbrandt, signore.",DIA_Gerbrandt_Hello_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_No_15_00"); //Ho capito, Gerbrandt.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_01"); //Attento alla tua boccaccia. Faresti meglio a mostrarmi un po' più di rispetto, oppure passerai un sacco di guai.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_02"); //Sono io che do gli ordini qui. Chiunque causi dei problemi dovrà risponderne a me e farà meglio a lasciare la città in fretta, perché una volta che avrò finito con lui, rimpiangerà di avermi incontrato.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_03"); //La maggior parte della gente al porto lavora per me. Se stai cercando del lavoro, dovresti fare in modo che i miei ricordi su di te siano buoni.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_15_00"); //Ho capito il punto, signor Gerbrandt, signore.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_01"); //Perlomeno non c'hai messo molto a capire come tira il vento da queste parti.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_02"); //Appena gli affari riprenderanno a prosperare, troverò sicuramente qualcosa da far fare a un tipo robusto come te.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_03"); //Saresti un ottimo capo magazziniere.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_04"); //Sai leggere?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"No.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Non voglio un lavoro.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Naturalmente.",DIA_Gerbrandt_Hello_Yes_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_No_15_00"); //No.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_01"); //Non importa, almeno sarai in grado di trascinare in giro qualche sacco.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_02"); //Se sarò soddisfatto di te, potrei persino offrirti un posto permanente. C'è molto da fare da queste parti.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_03"); //Bene allora, ti aspetterò non appena la prima nave tornerà in porto.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_NoJob ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_NoJob_15_00"); //Non voglio un lavoro.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_01"); //Pensi di essere incredibilmente furbo. Stai attento, nessuno ottiene un lavoro senza la mia approvazione.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_02"); //Se continui a essere così impertinente, ti ritroverai a dormire su un giaciglio di paglia infestato dagli insetti, perché sarà l'unico letto che potrai permetterti.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_03"); //Verrà il momento in cui mi implorerai di darti un lavoro.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_Yes ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //Naturalmente.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //Bene, bene. Del personale addestrato è sempre difficile da trovare.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //Che mi dici delle tue referenze?
	AI_Output (other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //Referenze?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //D'accordo, mi ricorderò la tua faccia. Quando il commercio riprenderà, torna a trovarmi. Potrei giusto avere un lavoro per te allora.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

FUNC VOID B_GErbrandt_PissOff ()
{
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_00"); //Cosa vuoi dire? Mi stai prendendo in giro?
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_01"); //Tu e il tuo amico Diego avete già causato troppi guai.
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_02"); //Lasciami in pace!
	
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
	description	= "Qualche novità?";
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
	AI_Output (other,self ,"DIA_Gerbrandt_Perm_15_00"); //Novità?
	
	if (Kapitel <= 2)
	{
		if (hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_01"); //La gente come te non ha niente da fare qui. Qui risiede la società rispettabile, non i vagabondi e i truffatori.
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_02"); //Se mai tu dovessi diventare benestante e rispettabile, allora sarai il benvenuto.
		}
		else
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_03"); //Non posso lamentarmi, onorevole Signore.
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if (hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL)
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_04"); //Conosco quelli come te... Non sapete proprio stare al vostro posto.
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_05"); //Dovrò parlare con il governatore riguardo a delle misure di sicurezza adeguate per i quartieri alti della città.
			}
			else
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_06"); //Sono affari miei. Sono occupato.
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
	description	= "Ti porto i saluti di Diego.";
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
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_00"); //Ti porto i saluti di Diego.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01"); //(spaventato) Cosa? Chi? Quale Diego?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_02"); //E vuole che io ti consegni questa lettera.
	
	B_GiveInvItems (other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03"); //(agitato) Non può essere. No, sono finito!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04"); //(impaurito) È in città dunque?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_05"); //Chi?
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06"); //Diego, naturalmente!
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_07"); //Sì, lo incontrerò qui tra poco.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08"); //(disperato, tra sé) È la fine allora. Tutto è perduto.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09"); //Non c'è tempo, devo andarmene da qui in fretta. Veloce, se mi trova, sono finito.
	
	MIS_DiegosResidence = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_DiegosResidence);
	
	DIEGO_COMING = TRUE;
};
