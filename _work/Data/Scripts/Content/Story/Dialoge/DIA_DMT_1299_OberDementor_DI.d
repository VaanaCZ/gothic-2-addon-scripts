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
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //As� que te has atrevido a acercarte a la puerta del amo, gusano asqueroso.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //�T� eres el que tiras de los hilos?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //Soy el guardi�n de los salones de Irdorath, la mayor fuente de poder de Beliar en la tierra. La fuerza divina del amo fluye por mis manos.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //Si pronuncio una sola palabra, te sumir�s en una locura eterna.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //Entiendo. Me parece que tengo que librarme de otro intermediario.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Estoy en la �ltima puerta. El mago negro parece ser la clave."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Ll�vame con tu maestro.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "�Cu�ntos m�s de los tuyos tendr� que matar?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "�Qu� se esconde detr�s de aquel portal enorme?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "�Qui�n es tu amo?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Antes eras disc�pulo del Durmiente.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //�Qui�n es tu amo?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //Es un peregrino que camina entre mundos. Su sabidur�a divina nos ilumina.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //Es el elegido de Beliar, que liberar� el reino de los malditos siervos de Innos.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //Mata a todos aquellos que ponen en duda su magnificencia.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //Me resulta familiar.

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //�Qu� se esconde detr�s de aquel portal enorme?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //(Se r�e) No puedes acceder a las estancias de mi se�or. No te conceder� la oportunidad de abrir el portal.

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //Antes eras disc�pulo del Durmiente.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //Eso fue en el lejano pasado. El amo nos ha abierto los ojos. Nadie podr� detenernos.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //El amo nos ha hecho ver cu�l es la �nica manera de encargarse de los infieles.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //�Cu�ntos m�s de los tuyos tendr� que matar?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //Somos muchos. No te haces una idea de lo numerosos que son aquellos que esperan la hora de la liberaci�n.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //Cuando salgamos a la luz, los lamentos inundar�n el pa�s.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //Liberaremos al mundo de los b�rbaros que se hacen llamar Guardianes del Fuego. No vamos a seguir mucho tiempo reunidos en el templo.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //S�.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //(Amenazador) �Basta de estupideces! Voy a destruirte.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //Se debilitar� tu vista y tu esp�ritu desaparecer� en las tinieblas.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //(Para s�) Sin ese amuleto de convocaci�n de almas, tendr�a un problema grave.
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



