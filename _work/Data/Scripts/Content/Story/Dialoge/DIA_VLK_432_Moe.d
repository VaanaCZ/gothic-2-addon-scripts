///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Moe_EXIT   (C_INFO)
{
	npc         = VLK_432_Moe;
	nr          = 999;
	condition   = DIA_Moe_EXIT_Condition;
	information = DIA_Moe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Moe_PICKPOCKET (C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 900;
	condition	= DIA_Moe_PICKPOCKET_Condition;
	information	= DIA_Moe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Moe_PICKPOCKET_Condition()
{
	C_Beklauen (25, 30);
};
 
FUNC VOID DIA_Moe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Moe_PICKPOCKET);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_BACK 		,DIA_Moe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Moe_PICKPOCKET_DoIt);
};

func void DIA_Moe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
	
func void DIA_Moe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
// ************************************************************
// 			     Hallo
// ************************************************************
INSTANCE DIA_Moe_Hallo(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 2;
	condition	= DIA_Moe_Hallo_Condition;
	information	= DIA_Moe_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       

FUNC INT DIA_Moe_Hallo_Condition()
{	
	if (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_NOV)
	&& (Npc_RefuseTalk(self) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Moe_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Moe_Hallo_01_00"); //Ehi, non ti conosco. Che cosa vuoi qui? Stai andando alla taverna?
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"No, non sto andando alla locanda... (FINE)",DIA_Moe_Hallo_Gehen);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Oh, cos� questa � la falda acquifera...",DIA_Moe_Hallo_Witz);
	Info_AddChoice 	  (DIA_Moe_Hallo,"S�, ti dispiace?",DIA_Moe_Hallo_Reizen);
};
FUNC VOID DIA_Moe_Hallo_Gehen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Gehen_15_00"); //No, non sto andando alla taverna...
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_01"); //Certo, � quello che avrei detto anche io. Ma non � importante ed � per questo che possiamo passare direttamente agli affari.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_02"); //Siccome sei nuovo da queste parti, ti far� un'offerta. Mi dai 50 pezzi d'oro e puoi andare.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_03"); //Questo � il prezzo per entrare nella taverna.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Cerchiamo di scoprire cosa pensa di questo la guardia cittadina...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice    (DIA_Moe_Hallo,"Scordatelo, non vedrai una sola moneta!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"Va bene. Pagher�.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice    (DIA_Moe_Hallo,"Ma non voglio andare alla locanda!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Kneipe()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Kneipe_15_00"); //Ma non voglio andare alla taverna!
	AI_Output (self ,other,"DIA_Moe_Hallo_Kneipe_01_01"); //Sai, prima o poi chiunque vuole andare alla taverna. Cos� puoi pagare adesso e andarci quando ti verr� voglia.
};
FUNC VOID  DIA_Moe_Hallo_Witz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Witz_15_00"); //Oh, cos� questa sarebbe la taverna del porto. E io che l'avevo scambiato per il palazzo del governatore.
	AI_Output (self ,other,"DIA_Moe_Hallo_Witz_01_01"); //Ehi, piantala con le battute, altrimenti ti far� mangiare i ciottoli...
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Capisco, sar� costretto a cambiarti i connotati...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Vuoi procurarmi guai?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Calmati, voglio solo bermi una birra.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice    (DIA_Moe_Hallo,"Ma non voglio andare alla locanda!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Reizen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Reizen_15_00"); //S�, ti dispiace?
	AI_Output (self ,other,"DIA_Moe_Hallo_Reizen_01_01"); //Non ci sono affari per te qui, animale.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Capisco, sar� costretto a cambiarti i connotati...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Vuoi procurarmi guai?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Calmati, voglio solo bermi una birra.",DIA_Moe_Hallo_Ruhig);
};
FUNC VOID DIA_Moe_Hallo_Miliz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Miliz_15_00"); //Cerchiamo di scoprire cosa pensa di questo la guardia cittadina...
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_01"); //(ride) L'esercito non � qui. E sai perch�?
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_02"); //Perch� qui siamo al porto, animale. Nessuno dell'esercito si azzarda a combattere con me quaggi�.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_03"); //Al limite, vanno alla Lanterna Rossa. Come puoi vedere, siamo solo io e te (ghigno sordido).
};
FUNC VOID DIA_Moe_Hallo_Pruegel()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Pruegel_15_00"); //Capisco, vorr� dire che mi toccher� darti una bella ripassata per poter proseguire.
	AI_Output (self ,other,"DIA_Moe_Hallo_Pruegel_01_01"); //Sei il benvenuto, animale. Preparati a difenderti!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Aerger()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Aerger_15_00"); //Vuoi procurarmi guai?
	AI_Output (self ,other,"DIA_Moe_Hallo_Aerger_01_01"); //Sicuro, sono un maestro nel cercare guai. Preparati a difenderti!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Ruhig()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Ruhig_15_00"); //Calmati, voglio solo bermi una birra.
	AI_Output (self ,other,"DIA_Moe_Hallo_Ruhig_01_01"); //D'accordo, ma entrare ti coster� 50 pezzi d'oro. (sogghigna)
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Scordatelo, non vedrai una sola moneta!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"Va bene. Pagher�.",DIA_Moe_Hallo_Zahlen);
	
};
FUNC VOID DIA_Moe_Hallo_Zahlen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_00"); //Va bene. Pagher�.
	
	if B_GiveInvItems (other, self, ItMi_Gold,50)
	{
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_01"); //Eccellente. E siccome questa � andata bene, puoi darmi anche il resto che hai addosso.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Scordatelo, non vedrai una sola moneta!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Ok, questo � tutto ci� che ho.",DIA_Moe_Hallo_Alles);
	}
	else if (Npc_HasItems (hero, ItMi_Gold) > 9)
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_02"); //...ma non ho cos� tanto oro con me.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_03"); //Non importa. Dammi tutto quello che hai.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Scordatelo, non vedrai una sola moneta!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Ok, questo � tutto ci� che ho.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_04"); //...ma non ho nemmeno 10 pezzi d'oro.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_05"); //Ma tutti a me capitano?
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_06"); //Va bene, sigh, puoi andare.
		
		AI_StopProcessInfos (self);
	};

};
FUNC VOID DIA_Moe_Hallo_Vergisses()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Vergisses_15_00"); //Scordatelo, non vedrai una sola moneta!
	AI_Output (self ,other,"DIA_Moe_Hallo_Vergisses_01_01"); //Allora prender� tutto ci� che hai non appena sarai disteso a terra.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Alles()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Alles_15_00"); //Ok, questo � tutto ci� che ho.
	
	B_GiveInvItems (other, self, ItMi_Gold, Npc_HasItems (other,ItMi_Gold));
	
	AI_Output (self ,other,"DIA_Moe_Hallo_Alles_01_01"); //Va bene, � abbastanza. Sono un generoso (sogghigna).
	AI_StopProcessInfos (self);
};
//************************************************
//	Das Hafenviertel
//************************************************

INSTANCE DIA_Moe_Harbor(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 998;
	condition	= DIA_Moe_Harbor_Condition;
	information	= DIA_Moe_Harbor_Info;
	permanent	= TRUE;
	description = "Sai come arrivare al porto, vero?";
};                       

FUNC INT DIA_Moe_Harbor_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_Moe_Harbor_Info()
{	
	AI_Output (other,self ,"DIA_Moe_Harbor_15_00"); //Sai come arrivare al porto, vero?
	AI_Output (self ,other,"DIA_Moe_Harbor_01_01"); //Certamente. Perch�?
	
	Info_ClearChoices (DIA_Moe_Harbor);
	Info_AddChoice		(DIA_Moe_Harbor, DIALOG_BACK, DIA_Moe_Harbor_Back);
	Info_AddChoice		(DIA_Moe_Harbor,"Com�� il traffico marittimo?",DIA_Moe_Harbor_Ship);
	Info_AddChoice		(DIA_Moe_Harbor,"Perch� non vedo nessuno della guardia cittadina?",DIA_Moe_Harbor_Militia);
	Info_AddChoice 		(DIA_Moe_Harbor,"Che genere di chiacchiere si stanno diffondendo?",DIA_Moe_Harbor_Rumors);
};

FUNC VOID DIA_Moe_Harbor_Back ()
{
	Info_ClearChoices (DIA_Moe_Harbor);
};

FUNC VOID DIA_Moe_Harbor_Ship ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Ship_15_00"); //Com�� il traffico marittimo?
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_01"); //L'unica nave che � arrivata di recente � quella dei paladini.
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_02"); //� laggi�, dietro la scogliera rocciosa a sud-ovest.
	
};

FUNC VOID DIA_Moe_Harbor_Militia ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Militia_15_00"); //Perch� non vedo nessuno della guardia cittadina?
	AI_Output (self ,other,"DIA_Moe_Harbor_Militia_01_01"); //Non hanno coraggio di venire qui. Ci arrangiamo da noi.
};

FUNC VOID DIA_Moe_Harbor_Rumors ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_00"); //Che genere di chiacchiere si stanno diffondendo?
	
	if (Kapitel == 1)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_01"); //Da queste parti non ci piacciono molto le persone che fanno troppe domande. Specialmente se sono stranieri.
	}
	else if (Kapitel == 2)
	{
		if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_02"); //Nulla, che cosa si dovrebbe dire? Tutto tranquillo da queste parti.
		}
		else if (hero.guild == GIL_KDF)
		|| (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_03"); //(forzato) Va male. Sono tempi duri e tutti cerchiamo di rigare diritto.
			AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_04"); //Smettila di sbeffeggiarmi.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_05"); //Come puoi pensare una cosa del genere? Sono mortalmente ferito.
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_06"); //La situazione � calda. Lord Andre ha provato a ficcare il naso in affari che non lo riguardavano.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_07"); //I palloni gonfiati non capiranno mai come funzionano le cose quaggi�.
		};
		
	}
	else if (Kapitel == 3)
	{
		if (Mis_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_08"); //Non abbiamo niente a che vedere con quell'affare.
				AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_09"); //Quale affare?
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_10"); //Con il paladino che hanno assassinato lass�. Dovresti preoccuparti dei mercenari, invece di perdere il tuo tempo quaggi�.
			}
			else
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_11"); //So che non sei coinvolto nella faccenda, ma l'uccisione del paladino ha spaventato il gentiluomo.
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_12"); //Se vuoi un consiglio da amico, sparisci dalla citt�. Per un po', almeno.
			};	
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_13"); //Da quando si � saputo che i mercenari non hanno fatto fuori il paladino, l'esercito non si arrischia neppure a venire qui...
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_14"); //Temo che abbiano paura di prenderle. A me sta bene.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_15"); //Non succede assolutamente nulla qui.
	}
	else //Kapitel 5
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_16"); //Finalmente quei palloni gonfiati di paladini stanno abbandonando il porto. Era ora.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LehmarGeldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Moe_LEHMARGELDEINTREIBEN		(C_INFO)
{
	npc			 = 	VLK_432_Moe;
	nr			 =  2;
	condition	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Moe_LEHMARGELDEINTREIBEN_Info ()
{
	AI_Output (self, other, "DIA_Moe_LEHMARGELDEINTREIBEN_01_00"); //Ehi, tu! Lehmar ti saluta.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};







