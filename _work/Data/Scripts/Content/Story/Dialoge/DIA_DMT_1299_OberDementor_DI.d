///////////////////////////////////////////////////////////////////////
//	Info hello
///////////////////////////////////////////////////////////////////////
instance DIA_Schwarzmagier_HELLO		(C_INFO)
{
	npc		 = 	DMT_1299_OberDementor_DI;
	nr		 = 	5;
	condition	 = 	DIA_Schwarzmagier_HELLO_Condition;
	information	 = 	DIA_Schwarzmagier_HELLO_Info;
	important	 = 	TRUE;
};

func int DIA_Schwarzmagier_HELLO_Condition ()
{
	return TRUE;
};
var int SC_KnowsMadPsi;		
func void DIA_Schwarzmagier_HELLO_Info ()
{
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //Dunque hai osato venire dinanzi al cancello del padrone, verme schifoso.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //Sei tu il capo qui?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //Io sono il guardiano delle Stanze di Irdorath, la più potente fonte di potere di Beliar sulla terra. Il potere divino del padrone scorre nelle mie mani.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //Basta solo una mia parola per farti cadere in uno stato di pazzia eterna.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //Capisco. Suppongo che devo sbarazzarmi di un altro emissario.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Sono all'ultimo portale. Il mago oscuro sembra essere la chiave."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Conducimi dal tuo maestro.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Quanti altri esemplari della tua specie devo ancora uccidere?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Cos si nasconde dietro quell’enorme portale laggiù?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Chi è il vostro maestro?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "In passato eri un seguace del Dormiente.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //Chi è il vostro maestro?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //Lui è uno che gira per i mondi. La sua saggezza divina illumina tutti noi.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //Egli è il prescelto di Beliar, colui che libererà il regno dai miseri seguaci di Innos.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //Egli porta morte fra tutti coloro che mettono in dubbio il suo potere.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //Questa l’ho già sentita.

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //Cosa si nasconde dietro quell’enorme portale laggiù?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //(ride) Non puoi accedere alle stanze del mio signore. Non ti permetterò di aprire il cancello.

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //In passato eri un seguace del Dormiente.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //Quello appartiene a un passato remoto. Il padrone ci ha aperto gli occhi. Niente può più fermarci ora.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //Il padrone ci ha mostrato l'unico modo possibile di trattare gli infedeli.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //Quanti altri esemplari della tua specie devo ancora uccidere?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //Noi siamo in molti. Non hai idea di quanti attendano quest'epoca di libertà.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //Grida di lamento scorreranno lungo la terra quando invaderemo il mondo.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //Per liberare il mondo da quei barbari che si autoproclamano Guardiani del fuoco. Il nostro raduno qui nel tempio non durerà a lungo.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //Sì.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //(minacciando) Ne ho abbastanza di queste sciocchezze! Ti annienterò.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //La tua vista svanirà e il tuo spirito scomparirà nelle tenebre.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //(fra sé e sé) Senza quell'amuleto per evocare le anime, sarà davvero dura.
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;
		
		if (hero.attribute[ATR_HITPOINTS] > 50)
			{
				hero.attribute[ATR_HITPOINTS] = ((hero.attribute[ATR_HITPOINTS])/2);
			};
		
		SC_ObsessionCounter = 100;
		B_SCIsObsessed (hero);
	};

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, DIALOG_ENDE, DIA_Schwarzmagier_HELLO_back );

};

func void DIA_Schwarzmagier_HELLO_back ()
{
	AI_StopProcessInfos (self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play 	("MFX_FEAR_CAST" );
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};



