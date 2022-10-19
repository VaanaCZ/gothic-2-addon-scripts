//##########################################################################
//##
//##	Hier stehen alle Buchst�ndermobsiscripte
//##
//##########################################################################


//*************************************
//	Buchst�nder in der Klosterbibliothek
//*************************************

FUNC VOID Use_Bookstand_01_S1()		//Buchst�nder in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	if  (hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE; //f�r die Pr�fung des Feuers 
			
			Log_CreateTopic (TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus	(TOPIC_FireContest,LOG_RUNNING);
			B_LogEntry (TOPIC_FireContest,"������ �����������, � ���� ����� ��������� ����������� ��������� �����. ������ �� ���� ����� ������� ������ ������ ���� ��� �������. ���� � ������ ��� ���������, � ���� ������ � ���� ����.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "��������� �����"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "���� ��������� ����� ����������� ���� ������� ������ ��������� ������, �� ����� �� �������, ��� �� ����������� ����� ������. ����, ������, �� ������ ��� ������� ����� ������� ����������� � ���� �� ���������� �� ����� �������, �� ������� ������ ��������� ����������� ����� ���������, � �� ���� ��� �� ����� �������� ��� � ����. �� ��������� ������ �� ������ ������ ��������� ������, �� ����� ����� ����������� ����� �����. ");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "��� ��������� ������ ��������� ���� ������ �������� ���� � �������� ����������. �������������, �� ������ ������ ��� ���������, ������ �� ������� ������ ��� ����� �� ����� ������� ������, ������ ��� ��� ����� ��������� ������� ������ ���� � �������������� � ���������� ����."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "������ ���� ������ � ��� ���� � ����."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "������ �����"					);
					Doc_Show		( nDocID );

			
	};
};

//*************************************
//	Buchst�nder in der Geheimen Bibliothek
//*************************************
//--------------------------------------
var int FinalDragonEquipment_Once;
//--------------------------------------

FUNC VOID Use_FINALDRAGONEQUIPMENT_S1()		//Buchst�nder in der geheimen Bibliothek 
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	
		var int nDocID;
		
		nDocID = 		Doc_Create		()			  ;							
						Doc_SetPages	( nDocID,  2 );                         
						Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0); 
						Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0);
					
						Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
						Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  	
	
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLines	( nDocID,  0, "... � �������, ��� ���� ����� ������� ���� �� ��������� �������. ������ ��������� ������, ��� �����, ��� �� ������ ���� ����� ��� �������������� �������. ��� �, ���� ��� ������ ��������� ��� ��������� ����� ������ ����, ����� ��� � �����. ��� �������� ������ ���������, ��� � ��� �������� ���������� �������, ����� ������������� � �����. ��� ������ ����� ������ ������ �������� ����� ����������, � ������ ��� ����, ��������� � ���� ������������, ����� ������� ������� � �������� �����.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"����������� ��� ���� '������ ������': 1 ������ ����, ������ �� �����");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "... � �������� ����������� � ������ ������� ������ ����� ������ ������ ������ ������, ������� �� ������ �����. ������ ������ ��� ���������. � ����������, ��� ��� ���������� ���������� ������ ����������."); 
						Doc_PrintLines	( nDocID,  1, "� ������� ��������� ���� ������ ��� ������� ���������. ���������� ��������� ����������� � ��� �� ��� ���, ���� �� ��������� ���������."	);
						Doc_PrintLines	( nDocID,  1, "����� ������, ��������,  ����� ������ ������ ���� � �������� �����. �� ������� ������ ��������� �� � ���� �� ����. � ����� ������ �� �����, � ����������."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"��� �������� ���� ���������� ������������� �����������. ��� ������ ���� ������������ � ������� ������� �����, ����� ������� ���� �� ������ �����.");
			B_LogEntry (TOPIC_TalentRunes,"����������� ��� ���� '��������� ��������': 1 ����� ������");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "����� ������� ���������� �����,  ���������� ������� ���� ������������. ��� ����� ��������� ������ ������ ������ � ��������� ��������� ������ ����. ��� ������ ���� ���� ����� ����������������� � �������."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "������ � ������ ������, ��� ����� ������ - ������ ��, ��� �������� ��������� ������������ � ����� ������� ������� '��������� ����'. ��� ��������, ��� ��� ������ ���� ���������, ��� � �����, � ����� ������� �������������� ���� ����������� ������. "	);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_Show		( nDocID );
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] 	= TRUE;	
			PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] 	= TRUE;	
			
			PrintScreen			(PRINT_LearnSmith, -1, -1, FONT_Screen, 2);
			Npc_SetTalentSkill 	(self, NPC_TALENT_SMITH, 1);
			Log_CreateTopic (TOPIC_TalentSmith,LOG_NOTE);
			B_LogEntry (TOPIC_TalentSmith,"����� �������� ������, ����� �������� ������, ������ ����� ��� ����� ����� �����. � ������ �������� ������� �� � ���� ���������� �����, � ����� ������� ����� �� ����������. ������ ������ �������� ������� ������ ����������, ��������� ������ ������ ��������.");
			B_LogEntry (TOPIC_TalentSmith,"���� � ������� 4 ����� ���� � 5 ������ ��������� �����, � ����� �������� ������ ������ '������ ��������'.");
			B_LogEntry (TOPIC_TalentSmith,"���� � ������� 5 ������ ���� � 5 ������ ��������� �����, � ����� �������� ������� ������ ������ '������ ��������'.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "������ ���������� ��������."); 
						Doc_PrintLines	( nDocID,  1, "����� ������� ������� �� ����� ������� ����������� ��������, ������� ����� ������� �����, ������� � ������ �� ������� �������."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "����� ���������� ���, ���������  ���������� ��������, ���� ��� ������ ���� ������� � ��������� �����. 5 ���� ����� ����� ������� ����� ��������������� ������� � ���������."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "����������: '�������' �������� ������������� ��������� �������� '�������'.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

