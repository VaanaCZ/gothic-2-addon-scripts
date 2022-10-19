///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lehmar_EXIT   (C_INFO)
{
	npc         = VLK_484_Lehmar;
	nr          = 999;
	condition   = DIA_Lehmar_EXIT_Condition;
	information = DIA_Lehmar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Lehmar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lehmar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Entschuldigung
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_ENTSCHULDIGUNG		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  2;
	condition	 = 	DIA_Lehmar_ENTSCHULDIGUNG_Condition;
	information	 = 	DIA_Lehmar_ENTSCHULDIGUNG_Info;
	permanent 	 =  FALSE;
	description	 = 	"Cosa succede?";
};

func int DIA_Lehmar_ENTSCHULDIGUNG_Condition ()
{
	return TRUE;
};

func void DIA_Lehmar_ENTSCHULDIGUNG_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_00"); //Come va?
	AI_Output (self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_01"); //(annoiato) Quanto vuoi?
	AI_Output (other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_02"); //Che cosa vuoi dire con 'Quanto vuoi'?
	AI_Output (self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_03"); //Io sono l'usuraio e tu sei venuto da me. Che cosa vuoi? Soldi, ovviamente.
};

///////////////////////////////////////////////////////////////////////
//	Info GeldLeihen
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_GELDLEIHEN		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  3;
	condition	 = 	DIA_Lehmar_GELDLEIHEN_Condition;
	information	 = 	DIA_Lehmar_GELDLEIHEN_Info;
	permanent	 = 	TRUE;
	description	 = 	"Prestami del denaro!";
};
//----------------------------------------
var int DIA_Lehmar_GELDLEIHEN_noPerm;
//----------------------------------------
func int DIA_Lehmar_GELDLEIHEN_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Lehmar_ENTSCHULDIGUNG))
	&&  (DIA_Lehmar_GELDLEIHEN_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDLEIHEN_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_15_00"); //Prestami del denaro!
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_09_01"); //Certo! E quanto vorresti? Io carico del 20 percento!

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "Ci penserò su.", DIA_Lehmar_GELDLEIHEN_back );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "1000 monete d’oro.", DIA_Lehmar_GELDLEIHEN_1000 );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, " 200 monete d’oro.", DIA_Lehmar_GELDLEIHEN_200 );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "   50 monete d’oro.", DIA_Lehmar_GELDLEIHEN_50 );
	
	
};
func void DIA_Lehmar_GELDLEIHEN_back ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_back_15_00"); //Ci penserò su.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_back_09_01"); //Ehi sveglia! Non farmi perdere tempo!

	AI_StopProcessInfos (self);
};

func void DIA_Lehmar_GELDLEIHEN_50 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_50_15_00"); //50 monete d’oro.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_50_09_01"); //Robetta eh? Li rivoglio domani, capito?

	CreateInvItems (self, ItMi_Gold, 50);
	B_GiveInvItems (self, other, ItMi_Gold, 50);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 50;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

};

func void DIA_Lehmar_GELDLEIHEN_200 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_200_15_00"); //200 monete d’oro.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_200_09_01"); //Sono un sacco di soldi. Ti voglio rivedere qui domani, con i soldi. Capito?
	

	CreateInvItems (self, ItMi_Gold, 200);
	B_GiveInvItems (self, other, ItMi_Gold, 200);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 200;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

};

func void DIA_Lehmar_GELDLEIHEN_1000 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_1000_15_00"); //1000 monete d’oro.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_01"); //Hai qualche rotella fuori posto o cosa?
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_02"); //Ti darò 100 pezzi e non dimenticarti che li rivoglio domani!
	

	CreateInvItems (self, ItMi_Gold, 100);
	B_GiveInvItems (self, other, ItMi_Gold, 100);


	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 100;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);
};

///////////////////////////////////////////////////////////////////////
//	Info warumGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_WARUMGELD		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  3;
	condition	 = 	DIA_Lehmar_WARUMGELD_Condition;
	information	 = 	DIA_Lehmar_WARUMGELD_Info;
	permanent	 =  FALSE;
	description	 = 	"Sei solito consegnare il tuo denaro alla gente in questo modo?";
};

func int DIA_Lehmar_WARUMGELD_Condition ()
{
	if (Lehmar_GeldGeliehen != 0)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_WARUMGELD_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_WARUMGELD_15_00"); //Sei solito consegnare il tuo denaro alla gente in questo modo?
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_01"); //(divertito) Non preoccuparti. Tornerai. Altrimenti ti troverò e ti ucciderò. Semplice.
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_02"); //Hai una faccia così da babbeo che non farò fatica a trovarti.
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_03"); //Perciò non pensare di fregarmi.
};
///////////////////////////////////////////////////////////////////////
//	Info geldeintreiben
///////////////////////////////////////////////////////////////////////
var int Lehmar_vorbei;

instance DIA_Lehmar_GELDEINTREIBEN		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  5;
	condition	 = 	DIA_Lehmar_GELDEINTREIBEN_Condition;
	information	 = 	DIA_Lehmar_GELDEINTREIBEN_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Lehmar_GELDEINTREIBEN_Condition ()
{
	if ((Lehmar_GeldGeliehen_Day<=(Wld_GetDay()-2))
	&& (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDEINTREIBEN_Info ()
{
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_09_00"); //Sei in ritardo, bastardo! Dammi i soldi! E siccome ho dovuto ricordartelo, ti costerà di più.
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_09_01"); //Il 30 percento invece del normale 20 percento.


	Info_ClearChoices	(DIA_Lehmar_GELDEINTREIBEN);
	Info_AddChoice	(DIA_Lehmar_GELDEINTREIBEN, "Pagherò il mio debito.", DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen );
	Info_AddChoice	(DIA_Lehmar_GELDEINTREIBEN, "Non ti darò proprio niente.", DIA_Lehmar_GELDEINTREIBEN_kannstmich );
};
func void DIA_Lehmar_GELDEINTREIBEN_kannstmich ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00"); //Non ti darò proprio niente.
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01"); //Oh sì, lo farai.
	Lehmar_vorbei = TRUE;
	AI_StopProcessInfos (self);		
	
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00"); //Pagherò il mio debito.

				 	///////////////////////////////////////////////////////////////////////	
		 	
				 				 	if (Lehmar_GeldGeliehen == 50)
										{
											Lehmar_GeldGeliehen_MitZinsen = 65;	
										};
									if (Lehmar_GeldGeliehen == 200)
										{
											Lehmar_GeldGeliehen_MitZinsen = 260;	
										};
									if (Lehmar_GeldGeliehen == 100)
										{
											Lehmar_GeldGeliehen_MitZinsen = 130;	
										};
					///////////////////////////////////////////////////////////////////////						
										IntToFloat	(Lehmar_GeldGeliehen_MitZinsen);


	if ((Npc_HasItems (other,ItMi_Gold)) >= Lehmar_GeldGeliehen_MitZinsen )
	{
		B_GiveInvItems (other, self, ItMi_Gold, Lehmar_GeldGeliehen_MitZinsen);
		
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01"); //Meglio per te! E ora sparisci!
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos (self);		
	}
	else
	{
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02"); //Non hai abbastanza soldi! Bene, vedo che dovrò darti una lezione.
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03"); //Non prenderla sul personale, ho una reputazione da mantenere.
		Lehmar_vorbei = TRUE;
		
		AI_StopProcessInfos (self);		
		
		B_Attack (self, other, AR_NONE, 1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Geldzurück
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_GELDZURUECK		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  6;
	condition	 = 	DIA_Lehmar_GELDZURUECK_Condition;
	information	 = 	DIA_Lehmar_GELDZURUECK_Info;
	permanent	 =  TRUE;
	description	 = 	"Riecco i tuoi soldi!";
};
func int DIA_Lehmar_GELDZURUECK_Condition ()
{
	if 	(!(Npc_KnowsInfo(other, DIA_Lehmar_GELDEINTREIBEN))
	&&  (Lehmar_GeldGeliehen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDZURUECK_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDZURUECK_15_00"); //Riecco i tuoi soldi!

	if  (RangerHelp_LehmarKohle == TRUE)
	&& (Lehmar_GeldGeliehen_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_00"); //Non preoccuparti. Ci ha già pensato Lares.
		AI_Output (self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_01"); //Quel bastardo è un tuo amico, eh? Beh, non sono affari miei. Buona giornata.
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos (self);		
	}
	else
	{
					 	///////////////////////////////////////////////////////////////////////	
					 								 	
					 				 	if (Lehmar_GeldGeliehen == 50)
											{
												Lehmar_GeldGeliehen_MitZinsen = 60;	
											};
										if (Lehmar_GeldGeliehen == 200)
											{
												Lehmar_GeldGeliehen_MitZinsen = 240;	
											};
										if (Lehmar_GeldGeliehen == 100)
											{
												Lehmar_GeldGeliehen_MitZinsen = 120;	
											};
						///////////////////////////////////////////////////////////////////////						
											IntToFloat	(Lehmar_GeldGeliehen_MitZinsen);
		
		if ( (Npc_HasItems (other,ItMi_Gold)) >= Lehmar_GeldGeliehen_MitZinsen )
		{
			B_GiveInvItems (other, self, ItMi_Gold, Lehmar_GeldGeliehen_MitZinsen);
				
			AI_Output (self, other, "DIA_Lehmar_GELDZURUECK_09_01"); //Meraviglioso! È bello fare affari con te.
				
			Lehmar_GeldGeliehen = 0;
			AI_StopProcessInfos (self);		
		}
		else
		{
			AI_Output (self, other, "DIA_Lehmar_GELDZURUECK_09_02"); //Non ne hai abbastanza! Torna quando li avrai. Hai ancora tempo, ricorda il 20 percento!
			AI_StopProcessInfos (self);		
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info NOCHMALGELD
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_NOCHMALGELD		(C_INFO)
{
	npc		 	 = 	VLK_484_Lehmar;
	nr			 =  8;
	condition	 = 	DIA_Lehmar_NOCHMALGELD_Condition;
	information	 = 	DIA_Lehmar_NOCHMALGELD_Info;
	permanent	 =	TRUE;	//Joly: letzte Info die im KAPITEL 1 Stehen bleibt
	description	 = 	"Puoi prestarmi altro denaro?";
};
func int DIA_Lehmar_NOCHMALGELD_Condition ()
{
	if 	((Lehmar_GeldGeliehen == 0)
	&&  (Lehmar_GeldGeliehen_MitZinsen != 0)) //Joly: SC hat sich schon mal Geld geliehen!
	{
		return TRUE;
	};
};
func void DIA_Lehmar_NOCHMALGELD_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_NOCHMALGELD_15_00"); //Puoi prestarmi altro denaro?

	if (Npc_KnowsInfo(other, DIA_Lehmar_GELDEINTREIBEN))//Joly: SC hat Schulden nicht ordnungsgemäß zurück gezahlt!
	|| (Npc_KnowsInfo (other, DIA_Lehmar_BuchWeg))
	{
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_01"); //Pensi che sia stupido? Sparisci!
	}
	else
	{
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_02"); //Non più, adesso! Ho appena avuto una grossa uscita e ora ho bisogno di denaro.
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_03"); //Torna tra qualche giorno.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lehmar_PICKPOCKET (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 900;
	condition	= DIA_Lehmar_PICKPOCKET_Condition;
	information	= DIA_Lehmar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sarebbe un gioco da ragazzi sottrargli il suo piccolo libro)";
};                       

FUNC INT DIA_Lehmar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_Schuldenbuch) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Lehmar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lehmar_PICKPOCKET);
	Info_AddChoice		(DIA_Lehmar_PICKPOCKET, DIALOG_BACK 		,DIA_Lehmar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lehmar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lehmar_PICKPOCKET_DoIt);
};

func void DIA_Lehmar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItWr_Schuldenbuch, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Lehmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Lehmar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  			Schuldenbuch weg
// ************************************************************

INSTANCE DIA_Lehmar_BuchWeg (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 1;
	condition	= DIA_Lehmar_BuchWeg_Condition;
	information	= DIA_Lehmar_BuchWeg_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lehmar_BuchWeg_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Lehmar_BuchWeg_Info()
{	
	AI_Output (self, other, "DIA_Lehmar_Add_09_00"); //(con rimorso) Qualche miserabile ladruncolo ha rubato il mio libro mastro...
	AI_Output (self, other, "DIA_Lehmar_Add_09_01"); //Non hai niente a che fare con questa faccenda, vero?
	AI_Output (other, self, "DIA_Addon_Lehmar_Add_15_02"); //(sorride) Io? No.
	AI_Output (self, other, "DIA_Lehmar_Add_09_03"); //Sì, sì, certamente... Esci di qui...
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  			Lehmar verhauen
// ************************************************************
INSTANCE DIA_Lehmar_verhauen (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 1;
	condition	= DIA_Lehmar_verhauen_Condition;
	information	= DIA_Lehmar_verhauen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
FUNC INT DIA_Lehmar_verhauen_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (Npc_KnowsInfo (other, DIA_Lehmar_BuchWeg))
		|| (Lehmar_vorbei == TRUE)
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Lehmar_verhauen_Info()
{	
	B_Say (self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};





