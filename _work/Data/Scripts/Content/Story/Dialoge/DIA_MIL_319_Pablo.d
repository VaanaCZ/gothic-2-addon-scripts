///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_EXIT   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 999;
	condition   = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pablo_PICKPOCKET (C_INFO)
{
	npc			= Mil_319_Pablo;
	nr			= 900;
	condition	= DIA_Pablo_PICKPOCKET_Condition;
	information	= DIA_Pablo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sarebbe un gioco da ragazzi sottrargli la chiave)";
};                       

FUNC INT DIA_Pablo_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_01) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Pablo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pablo_PICKPOCKET);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_BACK 		,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Pablo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pablo_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info WANTED
///////////////////////////////////////////////////////////////////////
var int Pablo_belogen;
//--------------------

instance DIA_Pablo_WANTED		(C_INFO)
{
	npc			 = 	Mil_319_Pablo;
	nr			 = 	1;
	condition	 = 	DIA_Pablo_WANTED_Condition;
	information	 = 	DIA_Pablo_WANTED_Info;
	important	 = 	TRUE;
};
func int DIA_Pablo_WANTED_Condition ()
{
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
func void DIA_Pablo_WANTED_Info ()
{
	AI_Output (self, other, "DIA_Pablo_WANTED_12_00"); //Ehi tu, aspetta. Hai un'aria familiare.
	AI_Output (other, self, "DIA_Pablo_WANTED_15_01"); //Cosa vuoi?
	AI_Output (self, other, "DIA_Pablo_WANTED_12_02"); //Ho già visto la tua faccia da qualche parte... Ah, giusto!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Pablo_WANTED_12_03"); //Ecco, abbiamo trovato questo ritratto addosso a dei briganti che abbiamo catturato qualche giorno fa. Il tizio raffigurato somiglia incredibilmente a te.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
	AI_Output (self, other, "DIA_Pablo_WANTED_12_04"); //Sembra che quei tizi ti stessero cercando.
	
	
	Info_ClearChoices (DIA_Pablo_WANTED);
	
	Info_AddChoice  (DIA_Pablo_WANTED,"No, devi esserti sbagliato.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice 	(DIA_Pablo_WANTED,"Accidenti, non ci sarei mai arrivato da solo.",DIA_Pablo_WANTED_IRONY);
};
FUNC VOID DIA_Pablo_WANTED_NOTHING()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //No, credo che tu ti stia sbagliando. Non ho nessun problema...
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //Come vuoi, straniero.
	//AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); //Aber wenn du Probleme hast - dann lass sie außerhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self ,other,"DIA_Pablo_Add_12_00"); //Ma se questa è davvero la TUA faccia e se hai dei problemi, tienili fuori da questa città. Le cose qui sono già abbastanza difficili.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //E gli stranieri che portano guai in città non vi restano a lungo... Spero di essere stato chiaro.
	Pablo_belogen = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pablo_WANTED_IRONY()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //Accidenti, non ci sarei mai arrivato da solo.
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //Davvero divertente... Cosa volevano quei tizi da te?
	//AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_02"); //Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output (other, self,"DIA_Pablo_Add_15_01"); //Perché non glielo chiedi di persona? Li avete rinchiusi in prigione, non è vero?
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //No, sono morti.
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //Credo che non lo scopriremo mai allora.
	//AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_05"); //Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Schönen Tag noch.
	AI_Output (self ,other,"DIA_Pablo_Add_12_02"); //Se ti trovi coinvolto in qualche guaio vai a parlare con Lord Andre, forse lui può aiutarti. Lo troverai nella caserma.
	
	AI_StopProcessInfos (self);
};

// *************************************************************
// 							Banditen
// *************************************************************
INSTANCE DIA_Pablo_Banditen   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Banditen_Info;
	permanent   = FALSE;
	description = "Cosa mi dici dei briganti?";
};
FUNC INT DIA_Pablo_Banditen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Banditen_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_03"); //Cosa mi dici dei briganti?
	//AI_Output (other, self, "DIA_Pablo_Banditen_15_00"); //Was weißt du über die Banditen, die vor der Stadt ihr Unwesen treiben?
	AI_Output (self ,other,"DIA_Pablo_Add_12_04"); //Provengono tutti da quella maledetta colonia mineraria. Ma ci sono diversi gruppi.
	AI_Output (self ,other,"DIA_Pablo_Add_12_05"); //Alcuni si sono rifugiati sulle montagne, mentre altri si sono uniti a Onar, il proprietario terriero.
	AI_Output (self ,other,"DIA_Pablo_Add_12_06"); //Ma sono i briganti fuori della città che causano la maggior parte dei problemi.
	AI_Output (self ,other,"DIA_Pablo_Add_12_07"); //È colpa loro se ora nessun mercante osa più avventursi oltre i cancelli cittadini.
};

// *************************************************************
// 							HakonBandits
// *************************************************************
INSTANCE DIA_Pablo_HakonBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent   = FALSE;
	description = "Cosa mi dici dei briganti che hanno derubato Hakon il mercante?";
};
FUNC INT DIA_Pablo_HakonBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Miliz))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_HakonBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_20"); //Cosa mi dici dei briganti che hanno derubato il mercante Hakon?
	AI_Output (self ,other,"DIA_Pablo_Add_12_21"); //Oh, QUELL'incidente. Non ricordarmelo...
	AI_Output (self ,other,"DIA_Pablo_Add_12_22"); //Per quanto ne sappiamo, essi sono i responsabili della maggior parte degli attacchi ai mercanti.
	
	AI_Output (self, other, "DIA_Pablo_Banditen_12_01"); //Quei topi di fogna si sono rintanati nei loro buchi e non osano può uscire.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_02"); //Una volta siamo riusciti a rintracciarli e a seguirli fino al bosco fuori città, ma poi abbiamo lasciato perdere.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_03"); //Ci sono troppe bestie che girano da quelle parti, è troppo pericoloso.
	
	B_LogEntry(TOPIC_HakonBanditen,"I briganti che hanno derubato Hakon si nascondono da qualche parte nei boschi vicini alla città." );
	
	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_23"); //Ma c'è un'altra cosa...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_04"); //Alcune delle merci rubate sono state rivendute qui a Khorinis.
		AI_Output (other, self, "DIA_Pablo_Banditen_15_05"); //Ciò significa che essi sanno come poter far entrare di nascosto le merci in città e come rivenderle...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_06"); //Sì, sospettiamo che abbiano un ricettatore in città, ma non siamo ancora riusciti a prenderlo.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_07"); //Se scopri qualcosa su questa faccenda, ricordati che Lord Andre ha messo una taglia sul ricettatore.
	
		B_LogEntry(TOPIC_HakonBanditen,"I briganti sono probabilmente in combutta con qualche ricettatore in città. Lord Andre ha offerto una ricompensa per chi trova il ricettatore." );
	};
}; 

// *************************************************************
// 							MyBandits
// *************************************************************
INSTANCE DIA_Pablo_MyBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 4;
	condition   = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent   = FALSE;
	description = "Da dove venivano quei briganti con in mano il mio manifesto di ricercato?";
};
FUNC INT DIA_Pablo_MyBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Wanted))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_MyBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_08"); //Da dove venivano quei briganti con il mio ritratto da ricercato?
	if (Pablo_belogen == TRUE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_09"); //AH-HA! Allora è proprio la TUA faccia. Perché non lo hai ammesso subito?
		AI_Output (self ,other,"DIA_Pablo_Add_12_10"); //(interessato) Per cosa sei ricercato?
		AI_Output (other, self,"DIA_Pablo_Add_15_11"); //Non lo so, giuro!
		AI_Output (self ,other,"DIA_Pablo_Add_12_12"); //Sì, sì, ti credo. Lascia che ti dica una cosa. Se avessi anche solo sospettato che tu fossi in combutta con quei briganti, a quest'ora saresti già a marcire in una cella, capito?
		AI_Output (self ,other,"DIA_Pablo_Add_12_13"); //Ad ogni modo, farò meglio a informare Lord Andre dell'accaduto...
		Pablo_AndreMelden = TRUE;
		AI_Output (self ,other,"DIA_Pablo_Add_12_14"); //Ma per rispondere alla tua domanda...
	};

	AI_Output (self ,other,"DIA_Pablo_Add_12_15"); //Li abbiamo catturati vicino alla fattoria del proprietario terriero.
	AI_Output (self ,other,"DIA_Pablo_Add_12_16"); //Ma non sembrano essere uomini di Onar.
	AI_Output (self ,other,"DIA_Pablo_Add_12_17"); //Credo che facciano parte di un gruppo più piccolo che si è rifugiato sulle montagne vicino la fattoria di Onar.
	AI_Output (self ,other,"DIA_Pablo_Add_12_18"); //Ma se hai intenzione di andare lì, lascia che ti avverta: quei tagliagole uccidono chiunque gli capiti a tiro!
	AI_Output (other, self,"DIA_Pablo_Add_15_19"); //Me ne ricorderò.
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_Perm   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 1;
	condition   = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent   = TRUE;
	description = "Come vanno le cose?";
};
FUNC INT DIA_Pablo_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Perm_Info()
{
	AI_Output (other, self, "DIA_Pablo_Perm_15_00"); //Come vanno le cose?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_01"); //L'ho sempre detto che non ci si poteva fidare di questi mercenari.
				AI_Output (self, other, "DIA_Pablo_Perm_12_02"); //Era ora che dessimo una bella lezione a questa feccia. Bennet non può aver architettato tutto da solo.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_03"); //Sono profondamente scosso dall'assassinio dell'onorevole paladino Lothar.
				AI_Output (self, other, "DIA_Pablo_Perm_12_04"); //Ma so che la chiesa troverà una giusta punizione per il colpevole.
			}
			else
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_05"); //Cosa ci fai da queste parti? Se stai cercando di liberare il tuo amico mercenario, puoi anche lasciar perdere.
			};
		}
		else //Bennet ist unschuldig
		{
			AI_Output (self, other, "DIA_Pablo_Perm_12_06"); //È patetico. Ora stanno cercando di metterci uno contro l'altro.
			AI_Output (self, other, "DIA_Pablo_Perm_12_07"); //Se tu non fossi riuscito a trovare il vero colpevole per l'omicidio, gli orchi non avrebbero dovuto alzare un dito.
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_08"); //Sono preoccupato per ciò che accadrà se i paladini se ne andranno ora.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_09"); //Puoi contare su di noi. Useremo ogni mezzo possibile per impedire che la città degeneri in un covo di ingiustizie.
	}
	else if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_10"); //Fai attenzione a come ti muovi qui. Da queste parti siamo solito controllare da vicino i ladri come te.
	}
	else
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_11"); //Al momento è tutto tranquillo. Solo i briganti fuori dalla città ci stanno causando dei problemi.
	};	

}; 


